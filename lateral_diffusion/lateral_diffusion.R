###This script runs estimates on Cy3-based lateral diffusion in SM-Omics or ST based data.
## This script recreates figures FigS1: F-G in SM-Omics: An automated platform for high-throughput spatial multi-omics; doi: https://doi.org/10.1101/2020.10.14.338418 

# set warnings
options(warn=-1)

# raw data files needed to run are available at SCP: https://singlecell.broadinstitute.org/single_cell/study/SCP979/
# please download if_permeabilization.zip and he_permeabilization.zip

# set wd to where your downloaded data is
setwd("../../smomics_data")

# functions: gets local minima
inflect <- function(x, threshold = 1){
  up   <- sapply(1:threshold, function(n) c(x[-(seq(n))], rep(NA, n)))
  down <-  sapply(-1:-threshold, function(n) c(rep(NA,abs(n)), x[-seq(length(x), length(x) - abs(n) + 1)]))
  a    <- cbind(x,up,down)
  list(minima = which(apply(a, 1, min) == a[,1]), maxima = which(apply(a, 1, max) == a[,1]))
}

#read in files: make sure he_diffution folder is in ./data
bravo_cy3_files = list.files("./he_diffusion", pattern = "bravo_cy3") #for sm-omics HE diffusion estimates
bravo_cy3_files = list.files("./he_diffusion", pattern = "manual_cy3") #for regular st HE diffusion estimates ## remember to uncomment line 30

# get diffusion per cell
lf_bravo = ""
rg_bravo = ""
for (f in bravo_cy3_files){
  # read in cy3 image
  fl_cy3 = read.delim(paste0("./he_diffusion/", f), header =T, sep =",")$Y
  
  #set which cell it is
  cl = sapply(strsplit(f, split = "_"),"[[",1)
  
  # load same he data 
  #fl_he = read.delim(paste0("./he_diffusion/", cl ,"_bravo_he.csv"),header =T, sep =",")$Y
  fl_he = read.delim(paste0("./he_diffusion/", cl ,"_manual_he.csv"),header =T, sep =",")$Y
  
  # modify scales to make relative scale 
  fl_he_sc = fl_he-max(fl_he)
  fl_cy3_sc = fl_cy3-min(fl_cy3)
  
  # make curve fit for he
  y_he = abs(fl_he_sc)
  x_he = seq(1,length(y_he), by = 1)
  
  # generate a 5th polynom of the curve
  fit5_he <- lm(y_he~poly(x_he, 15, raw=TRUE))
  
  # repeat curve fit for Cy3
  y_cy3 = fl_cy3_sc
  x_cy3 = seq(1,length(y_cy3), by=1)
  
  # generate a 5th polynom of the curve
  fit5_cy3 <- lm(y_cy3~poly(x_cy3, 15, raw=TRUE))
  
  # generate range of 30 numbers starting from 0 and ending at max(x)
  xx_he <- seq(1, length(fl_he_sc), by=1)
  xx_cy3 <- seq(1, length(fl_cy3_sc), by=1)
  
  # check which max(x) is smaller
  if (max(xx_cy3) <= max(xx_he)) mxx = max(xx_cy3) else mxx = max(xx_he)
  
  # re-generate range of 30 numbers starting from 0 and ending at max(x)
  xx <- seq(1, mxx, length=100)
  
  png(paste0(cl, "_hist_bravo_perm.png"))
  plot(x_cy3, y_cy3, pch=19,ylim=c(0,200), xlim = c(1,mxx))
  points(1:length(abs(fl_he_sc)), abs(fl_he_sc), pch = 19, col = "blue")
  lines(xx_cy3, predict(fit5_cy3, data.frame(x=xx_cy3)), col="black")
  lines(xx_he, predict(fit5_he, data.frame(x=xx_he)), col="blue")
  
  # now that you have two fits
  pr = c(predict(fit5_cy3, data.frame(x=xx_cy3)))
  cy3 = data.frame(pr, xx_cy3)
  colnames(cy3) = c("y_cy3", "x_cy3")
  
  pr = c(predict(fit5_he, data.frame(x=xx_he)))
  he = data.frame(pr, xx_he)
  colnames(he) = c("y_he", "x_he") 
  
  plot(he$x_he, he$y_he, col="black")
  points(cy3$x_cy3, cy3$y_cy3, col="black")
  
  # check distance on x-axis when he signal reaches 10% its max
  ## first find x when y = max(y) he
  # this is to differentiate between the left and right borders
  x_max = he[he$y_he == max(he$y_he),]$x_he
  
  # predict local maxima and minima to adjust for cell borders
  n <- 1
  left_x_he=he[he$x_he<x_max,]
  randomwalk <- left_x_he$y_he
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  left_x_he = left_x_he[left_x_he$y_he %in% randomwalk[bottoms[[n]]] & left_x_he$y_he<0.3*max(left_x_he$y_he),]
  left_x_he_final = left_x_he[max(left_x_he$x_he) ==left_x_he$x_he,]
  if (nrow(left_x_he_final) == 0){
    left_x_he=he[he$x_he<x_max & he$y_he > 0.1*max(y_he),]
    left_x_he_final = left_x_he[(left_x_he$y_he) == min(left_x_he$y_he),]
  }
  
  # predict local maxima and minima to adjust for cell borders
  right_x_he=he[he$x_he>x_max,]
  randomwalk <- right_x_he$y_he
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  right_x_he = right_x_he[right_x_he$y_he %in% randomwalk[bottoms[[n]]] & right_x_he$y_he<0.3*max(right_x_he$y_he),]
  right_x_he_final = right_x_he[min(right_x_he$x_he) == right_x_he$x_he,]
  if (nrow(right_x_he_final) == 0){
    right_x_he=he[he$x_he<x_max & he$y_he > 0.1*max(y_he),]
    right_x_he_final = right_x_he[(right_x_he$y_he) == min(right_x_he$y_he),]
  }
  ## designate left and right part of curve
  #left_x_he = he[he$y_he>=0.1*max(he$y_he) & he$x_he<x_max,]
  #right_x_he = he[he$y_he>=0.1*max(he$y_he) & he$x_he>x_max,]
  
  # predict local maxima and minima to adjust for cell borders
  n <- 1
  left_x_cy3=cy3[cy3$x_cy3<x_max,]
  randomwalk <- left_x_cy3$y_cy3
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  left_x_cy3 = left_x_cy3[left_x_cy3$y_cy3 %in% randomwalk[bottoms[[n]]] & left_x_cy3$y_cy3<0.3*max(left_x_cy3$y_cy3) & left_x_cy3$y_cy3>0.1*max(cy3$y_cy3),]
  left_x_cy3_final = left_x_cy3[max(left_x_cy3$x_cy3) == left_x_cy3$x_cy3,]
  if (nrow(left_x_cy3_final) == 0){
    left_x_cy3=cy3[cy3$x_cy3<x_max & cy3$y_cy3 > 0.1*max(y_cy3),]
    left_x_cy3_final = left_x_cy3[(left_x_cy3$y_cy3) == min(left_x_cy3$y_cy3),]
  }
  
  
  # predict local maxima and minima to adjust for cell borders
  right_x_cy3=cy3[cy3$x_cy3>x_max,]
  randomwalk <- right_x_cy3$y_cy3
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  right_x_cy3 = right_x_cy3[right_x_cy3$y_cy3 %in% randomwalk[bottoms[[n]]] & right_x_cy3$y_cy3<0.3*max(right_x_cy3$y_cy3) & right_x_cy3$y_cy3>0.1*max(cy3$y_cy3),]
  right_x_cy3_final = right_x_cy3[min(right_x_cy3$x_cy3) == right_x_cy3$x_cy3,]
  if (nrow(right_x_cy3_final) == 0){
    right_x_cy3=cy3[cy3$x_cy3>x_max & cy3$y_cy3 > 0.1*max(y_cy3),]
    right_x_cy3_final = right_x_cy3[(right_x_cy3$y_cy3) == min(right_x_cy3$y_cy3),]
  }
  
  # plot lines
  abline(v = min(left_x_he_final$x_he), col = "blue")
  abline(v = min(left_x_cy3_final$x_cy3), col = "red")
  abline(v = max(right_x_cy3_final$x_cy3), col = "red")
  abline(v = max(right_x_he_final$x_he), col = "blue")
  
  dev.off()
  
  # calculate left and right permeabilization effects in pixels
  left_margin = min(left_x_he_final$x_he)-min(left_x_cy3_final$x_cy3)
  right_margin = max(right_x_cy3_final$x_cy3)-max(right_x_he_final$x_he)
  
  # collect all values 
  lf_bravo = c(lf_bravo, left_margin)
  rg_bravo = c(rg_bravo, right_margin)
  
}
lf_bravo= lf_bravo[-1]
rg_bravo = rg_bravo[-1]

# permeabilization on system: plot
mrg = as.numeric(c(lf_bravo, rg_bravo))
#mrg[is.infinite(mrg)] <- 0
mrg = mrg[!is.infinite(mrg)] 
px = 0.1728
mrg_bravo = mrg*px # this is now in um
mean(mrg_bravo) # this is your diffustion estimate in um
sd(mrg_bravo) # this is your sd diffusion estimate in um
#pdf("Permeabilization_histogram_example.pdf", useDingbats = F)
hist(mrg_bravo, xlab = "Distance [micrometers]", ylab = "Number of observations", main = "Diffusion estimate")
abline(v=mean(mrg_bravo), col ="red")
abline(v=sd(mrg_bravo), col ="red", lty = 2)
abline(v=-sd(mrg_bravo), col ="red", lty = 2)
#dev.off()

# make similar estimates for if data
bravo_cy3_files = list.files("./if_diffusion", pattern = "Cy3") #for sm-omics IF diffution estimates ## remember to uncomment line 29

lf_bravo = ""
rg_bravo = ""
for (f in bravo_cy3_files){
  # read in cy3 image
  fl_cy3 = read.delim(paste0("./if_diffusion/", f), header =T, sep =",")$Y
  
  #set which cell it is
  cl = sapply(strsplit(f, split = "_"),"[[",1)
  
  # load same he data 
  fl_he = read.delim(paste0("./if_diffusion/", cl ,"_DAPI.csv"),header =T, sep =",")$Y
  
  # modify scales to make relative scale 
  fl_he_sc = fl_he-min(fl_he)
  fl_cy3_sc = fl_cy3-min(fl_cy3)
  
  # make curve fit for he
  y_he = abs(fl_he_sc)
  x_he = seq(1,length(y_he), by = 1)
  
  # generate a 5th polynom of the curve
  fit5_he <- lm(y_he~poly(x_he, 15, raw=TRUE))
  
  # repeat curve fit for Cy3
  y_cy3 = fl_cy3_sc
  x_cy3 = seq(1,length(y_cy3), by=1)
  
  # generate a 5th polynom of the curve
  fit5_cy3 <- lm(y_cy3~poly(x_cy3, 15, raw=TRUE))
  
  # generate range of 30 numbers starting from 0 and ending at max(x)
  xx_he <- seq(1, length(fl_he_sc), by=1)
  xx_cy3 <- seq(1, length(fl_cy3_sc), by=1)
  
  # check which max(x) is smaller
  if (max(xx_cy3) <= max(xx_he)) mxx = max(xx_cy3) else mxx = max(xx_he)
  
  # re-generate range of 30 numbers starting from 0 and ending at max(x)
  xx <- seq(1, mxx, length=100)
  
  png(paste0(cl, "_hist_bravo_perm.png"))
  plot(x_cy3, y_cy3, pch=19,ylim=c(0,200), xlim = c(1,mxx))
  points(1:length(abs(fl_he_sc)), abs(fl_he_sc), pch = 19, col = "blue")
  lines(xx_cy3, predict(fit5_cy3, data.frame(x=xx_cy3)), col="black")
  lines(xx_he, predict(fit5_he, data.frame(x=xx_he)), col="blue")
  
  # now that you have two fits
  pr = c(predict(fit5_cy3, data.frame(x=xx_cy3)))
  cy3 = data.frame(pr, xx_cy3)
  colnames(cy3) = c("y_cy3", "x_cy3")
  
  pr = c(predict(fit5_he, data.frame(x=xx_he)))
  he = data.frame(pr, xx_he)
  colnames(he) = c("y_he", "x_he") 
  
  plot(he$x_he, he$y_he, col="black")
  points(cy3$x_cy3, cy3$y_cy3, col="black")
  
  # check distance on x-axis when he signal reaches 10% its max
  ## first find x when y = max(y) he
  # this is to differentiate between the left and right borders
  x_max = he[he$y_he == max(he$y_he),]$x_he
  
  # predict local maxima and minima to adjust for cell borders
  n <- 1
  left_x_he=he[he$x_he<x_max,]
  randomwalk <- left_x_he$y_he
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  left_x_he = left_x_he[left_x_he$y_he %in% randomwalk[bottoms[[n]]] & left_x_he$y_he<0.3*max(left_x_he$y_he),]
  left_x_he_final = left_x_he[max(left_x_he$x_he) ==left_x_he$x_he,]
  if (nrow(left_x_he_final) == 0){
    left_x_he=he[he$x_he<x_max & he$y_he > 0.1*max(y_he),]
    left_x_he_final = left_x_he[(left_x_he$y_he) == min(left_x_he$y_he),]
  }
  
  # predict local maxima and minima to adjust for cell borders
  right_x_he=he[he$x_he>x_max,]
  randomwalk <- right_x_he$y_he
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  right_x_he = right_x_he[right_x_he$y_he %in% randomwalk[bottoms[[n]]] & right_x_he$y_he<0.3*max(right_x_he$y_he),]
  right_x_he_final = right_x_he[min(right_x_he$x_he) == right_x_he$x_he,]
  if (nrow(right_x_he_final) == 0){
    right_x_he=he[he$x_he<x_max & he$y_he > 0.1*max(y_he),]
    right_x_he_final = right_x_he[(right_x_he$y_he) == min(right_x_he$y_he),]
  }
  ## designate left and right part of curve
  #left_x_he = he[he$y_he>=0.1*max(he$y_he) & he$x_he<x_max,]
  #right_x_he = he[he$y_he>=0.1*max(he$y_he) & he$x_he>x_max,]
  
  # predict local maxima and minima to adjust for cell borders
  n <- 1
  left_x_cy3=cy3[cy3$x_cy3<x_max,]
  randomwalk <- left_x_cy3$y_cy3
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  left_x_cy3 = left_x_cy3[left_x_cy3$y_cy3 %in% randomwalk[bottoms[[n]]] & left_x_cy3$y_cy3<0.3*max(left_x_cy3$y_cy3) & left_x_cy3$y_cy3>0.1*max(cy3$y_cy3),]
  left_x_cy3_final = left_x_cy3[max(left_x_cy3$x_cy3) == left_x_cy3$x_cy3,]
  if (nrow(left_x_cy3_final) == 0){
    left_x_cy3=cy3[cy3$x_cy3<x_max & cy3$y_cy3 > 0.1*max(y_cy3),]
    left_x_cy3_final = left_x_cy3[(left_x_cy3$y_cy3) == min(left_x_cy3$y_cy3),]
  }
  
  
  # predict local maxima and minima to adjust for cell borders
  right_x_cy3=cy3[cy3$x_cy3>x_max,]
  randomwalk <- right_x_cy3$y_cy3
  bottoms <- lapply(1:n, function(x) inflect(randomwalk, threshold = x)$minima)
  right_x_cy3 = right_x_cy3[right_x_cy3$y_cy3 %in% randomwalk[bottoms[[n]]] & right_x_cy3$y_cy3<0.3*max(right_x_cy3$y_cy3) & right_x_cy3$y_cy3>0.1*max(cy3$y_cy3),]
  right_x_cy3_final = right_x_cy3[min(right_x_cy3$x_cy3) == right_x_cy3$x_cy3,]
  if (nrow(right_x_cy3_final) == 0){
    right_x_cy3=cy3[cy3$x_cy3>x_max & cy3$y_cy3 > 0.1*max(y_cy3),]
    right_x_cy3_final = right_x_cy3[(right_x_cy3$y_cy3) == min(right_x_cy3$y_cy3),]
  }
  
  # plot lines
  abline(v = min(left_x_he_final$x_he), col = "blue")
  abline(v = min(left_x_cy3_final$x_cy3), col = "red")
  abline(v = max(right_x_cy3_final$x_cy3), col = "red")
  abline(v = max(right_x_he_final$x_he), col = "blue")
  
  dev.off()
  
  # calculate left and right permeabilization effects in pixels
  left_margin = min(left_x_he_final$x_he)-min(left_x_cy3_final$x_cy3)
  right_margin = max(right_x_cy3_final$x_cy3)-max(right_x_he_final$x_he)
  
  # collect all values 
  lf_bravo = c(lf_bravo, left_margin)
  rg_bravo = c(rg_bravo, right_margin)
  
}
lf_bravo= lf_bravo[-1]
rg_bravo = rg_bravo[-1]

# permeabilization on system: plot
mrg = as.numeric(c(lf_bravo, rg_bravo))
#mrg[is.infinite(mrg)] <- 0
mrg = mrg[!is.infinite(mrg)] 
px = 0.1728
mrg_bravo = mrg*px # this is now in um
mean(mrg_bravo) # this is your diffustion estimate in um
sd(mrg_bravo) # this is your sd diffusion estimate in um
#pdf("Permeabilization_histogram_example.pdf", useDingbats = F)
hist(mrg_bravo, xlab = "Distance [micrometers]", ylab = "Number of observations", main = "Diffusion estimate")
abline(v=mean(mrg_bravo), col ="red")
abline(v=sd(mrg_bravo), col ="red", lty = 2)
abline(v=-sd(mrg_bravo), col ="red", lty = 2)
#dev.off()

