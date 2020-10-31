###This script runs estimates SpoTeR performance (speed and accuracy)
## This script recreates figures FigS9-10 in SM-Omics: An automated platform for high-throughput spatial multi-omics; doi: https://doi.org/10.1101/2020.10.14.338418 

# set warnings
options(warn=-1)

# raw data files needed to run are avaialbe at SCP: https://singlecell.broadinstitute.org/single_cell/study/SCP979/
# please download spotter_testing_speed_results.xlsx, spotter_processing.zip, aligner_output.zip, stdetector_results.zip

# load libraries
library(gdata)
library(stringr)
library(ggplot2)

setwd("/Users/svickovi/Library/Mobile Documents/com~apple~CloudDocs/Desktop/ST2.0_figures/SpoTter_testing")

# read in times xls 
times=read.xls("spotter_testing_speed_results.xlsx")
times$Time=str_replace(times$Time, ",", ".")
total_sec = as.numeric(sapply(strsplit(as.character(times$Time), ":"),"[[",1))*60+as.numeric(sapply(strsplit(as.character(times$Time), ":"),"[[",2))
times$Time=total_sec

# plot for all processing steps (total time)
p <- ggplot(data = times, aes(x = times$Processing, y = 1/times$Time, na.rm = T, color = times$Processing)) + geom_boxplot(outlier.colour="black", outlier.shape=16, outlier.size=2, notch=FALSE)+ theme_bw()  
print(p)

# plot for aggregated manual 
aggdata <- aggregate(times$Time, by=list(times$Sample,str_replace(times$Processing, "Manual_Fiji", "Manual")), FUN=sum, na.rm=TRUE)
colnames(aggdata) = c("Sample", "Processing", "Time")
p <- ggplot(data = aggdata, aes(x = aggdata$Processing, y = aggdata$Time, na.rm = T, color = aggdata$Processing)) + geom_boxplot(outlier.colour="black", outlier.shape=16, outlier.size=2, notch=FALSE)+ theme_bw() + xlab("") + ylab("Processing speed") + labs(fill = "Approach")  
print(p )

# plot total processing speed
#pdf("Spotter_speed.pdf", width = 7, height = 7, useDingbats = F)
aggdata <- aggregate(times$Time, by=list(times$Sample,times$Processing_simple), FUN=sum, na.rm=TRUE)
colnames(aggdata) = c("Sample", "Processing", "Time")
p <- ggplot(data = aggdata, aes(x = aggdata$Processing, y = 1/aggdata$Time, na.rm = T, color = aggdata$Processing)) + geom_boxplot(outlier.colour="black", outlier.shape=16, outlier.size=2, notch=FALSE)+ theme_bw() + xlab("") + ylab("Processing time") + labs(fill = "Approach")  
print(p )
#dev.off()

# print speed diff
sp_speed = 1/mean(aggdata[aggdata$Processing == "SpoTter",]$Time)
man_speed = 1/mean(aggdata[aggdata$Processing == "Manual",]$Time)
stdot_speed = 1/mean(aggdata[aggdata$Processing == "ST_Detector",]$Time)

# print speed-up
sp_speed/stdot_speed
sp_speed/man_speed

# Test accuracy 
# we need to remove frame from spotter and stdet
frame = c(paste0(c(1:33), "x", 1), paste0(c(1), "x", c(1:35)),
          paste0(c(1:33), "x", 35), paste0(c(33), "x", c(1:35)),
          paste0(c(1:5), "x", 1), paste0(c(1:5), "x", 2),
          paste0(c(1:5), "x", 3), paste0(c(1:5), "x", 4),
          paste0(c(1:5), "x", 5))

# get names
man_files = list.files("./aligner_output", pattern = "*_spots.jpg_aligner_spots_under_tissue_IDs.txt")

# get sample names
patterns = sapply(str_split(man_files, "_spots.jpg_aligner_spots_under_tissue_IDs.txt" ),"[[",1)

# plot
#pdf("FP_spotter_testing.pdf", width = 12, height = 12, useDingbats = F)
layout(matrix(c(1:9), byrow=T, ncol = 3))
fp_stdet_stat=""
fp_sp_stat=""
for (i in patterns){
  # Test accuracy 
  array = sapply(strsplit(i, "_"), "[[",1)
  well = sapply(strsplit(i, "_"), "[[",2)
  
  sp = read.delim(paste0(getwd(),"/spotter_processing/",array,"_testing.", well, "-Spot000001_inferred_points.tsv"), header = T)
  man = read.delim(paste0(getwd(),"/aligner_output/", paste0(i, "_spots.jpg_aligner_spots_under_tissue_IDs.txt")), header = T)
  stdet = read.delim(paste0(getwd(),"/stdetector_results/", paste0("spot_data-sel-", i, "_CY3_staligner.tsv")), header = T)
  
  # subset to XxY
  sp = as.character(sp[sp$feature_spot == TRUE,]$bc)
  man = paste0(man$x, "x", man$y)
  stdet = paste0(stdet$x, "x", stdet$y)
  
  # remove frame
  sp = sp[!sp %in% frame]
  stdet = stdet[!stdet %in% frame]
  
  # FP spotter
  fp_stdet_stat = c(fp_stdet_stat, 100*length(setdiff(stdet, man))/length(union(stdet, man)))
  fp_sp_stat = c(fp_sp_stat, 100*length(setdiff(sp, man))/length(union(man, sp)))
  
  # to plot fp
  fp_sp = setdiff(sp, man)
  fp_stdet = setdiff(stdet, man)
  
  # to print
  fp_pr_stdet = round(100*length(setdiff(stdet, man))/length(union(stdet, man)), digit = 2)
  fp_pr_sp = round(100*length(setdiff(sp, man))/length(union(sp, man)), digit = 2)
  
  # make spatial plots for FP
  plot(sapply(str_split(man,"x"),"[[",1), sapply(str_split(man,"x"),"[[",2), main = i, cex = 1, col = "red", pch = 16, xlab ="", ylab = "", xlim = c(1,33), ylim = c(1,35))
  points(sapply(str_split(fp_sp,"x"),"[[",1), sapply(str_split(fp_sp,"x"),"[[",2), cex = 1, col = "blue", pch = 3)
  points(sapply(str_split(fp_stdet,"x"),"[[",1), sapply(str_split(fp_stdet,"x"),"[[",2), cex = 1, col = "black")
  text(x = 4, y = 35, paste0("FP ST Detector = ", fp_pr_stdet, "%"), cex = 0.5)
  text(x = 4, y = 33, paste0("FP SpoTteR = ", fp_pr_sp, "%"), cex = 0.5)
}
# dev.off()

#pdf("FN_spotter_testing.pdf", width = 12, height = 12, useDingbats = F)
layout(matrix(c(1:9), byrow=T, ncol = 3))
fn_stdet_stat=""
fn_sp_stat=""
for (i in patterns){
  # Test accuracy 
  array = sapply(strsplit(i, "_"), "[[",1)
  well = sapply(strsplit(i, "_"), "[[",2)
  
  sp = read.delim(paste0(getwd(),"/spotter_processing/",array,"_testing.", well, "-Spot000001_inferred_points.tsv"), header = T)
  man = read.delim(paste0(getwd(),"/aligner_output/", paste0(i, "_spots.jpg_aligner_spots_under_tissue_IDs.txt")), header = T)
  stdet = read.delim(paste0(getwd(),"/stdetector_results/", paste0("spot_data-sel-", i, "_CY3_staligner.tsv")), header = T)
  
  # subset to XxY
  sp = as.character(sp[sp$feature_spot == TRUE,]$bc)
  man = paste0(man$x, "x", man$y)
  stdet = paste0(stdet$x, "x", stdet$y)
  
  # remove frame
  sp = sp[!sp %in% frame]
  stdet = stdet[!stdet %in% frame]
  
  # FP spotter
  fn_stdet_stat = c(fn_stdet_stat, 100*length(setdiff(man, stdet))/length(union(stdet, man)))
  fn_sp_stat = c(fn_sp_stat, 100*length(setdiff(man, sp))/length(union(sp, man)))
  
  # to plot fn
  fn_sp = setdiff(man, sp)
  fn_stdet = setdiff(man, stdet)
  
  # to print
  fn_pr_stdet = round(100*length(setdiff(man, stdet))/length(union(stdet, man)), digit = 2)
  fn_pr_sp = round(100*length(setdiff(man, sp))/length(union(sp, man)), digit = 2)
  
  # make spatial plots for FP
  plot(sapply(str_split(man,"x"),"[[",1), sapply(str_split(man,"x"),"[[",2), main = i, cex = 1, col = "red", pch = 16, xlab ="", ylab = "", xlim = c(1,33), ylim = c(1,35))
  points(sapply(str_split(fn_sp,"x"),"[[",1), sapply(str_split(fn_sp,"x"),"[[",2), cex = 1, col = "blue", pch = 3)
  points(sapply(str_split(fn_stdet,"x"),"[[",1), sapply(str_split(fn_stdet,"x"),"[[",2), cex = 1, col = "black")
  text(x = 4, y = 35, paste0("FN ST Detector = ", fn_pr_stdet, "%"), cex = 0.5)
  text(x = 4, y = 33, paste0("FN SpoTteR = ", fn_pr_sp, "%"), cex = 0.5)
}
#dev.off()

# clean up 
fp_sp_stat = as.numeric(fp_sp_stat[-1])
fp_stdet_stat = as.numeric(fp_stdet_stat[-1])
fn_sp_stat = as.numeric(fn_sp_stat[-1])
fn_stdet_stat = as.numeric(fn_stdet_stat[-1])

# avg fp rates
pl = data.frame(c(fp_stdet_stat, fp_sp_stat, fn_stdet_stat, fn_sp_stat), rep(c(rep("Human Lung Cancer", 3), rep("Mouse Colon", 3), rep("Human Arthritis", 3)),4),c(rep("FP",18),rep("FN",18)), c(rep("StDet",9),rep("Spotter", 9),rep("StDet",9),rep("Spotter",9)))
colnames(pl) = c("Rates","Tissue","Type","Tool")

# plot for all processing steps (total time)
#pdf("FN_FP_spotter_testing_boxplots.pdf", width = 5, height = 5, useDingbats = F)
p <- ggplot(data = pl, aes(x = Tissue, y = Rates , na.rm = T, color = Tool)) + geom_boxplot(outlier.colour="black", outlier.shape=16, outlier.size=2, notch=FALSE)+ theme_bw() +facet_wrap(~Type)
print(p)
#dev.off()

fp_mat = matrix(as.numeric(fp_sp_stat), nrow = 3)
colMeans(fp_mat)
apply(fp_mat, 1, sd)
fp_mat[,1]
mean(as.numeric(fp_sp_stat))
sd(as.numeric(fp_sp_stat))
mean(as.numeric(fp_stdet_stat))
sd(as.numeric(fp_stdet_stat))

# avg fn rates
mean(as.numeric(fn_sp_stat))
sd(as.numeric(fn_sp_stat))
mean(as.numeric(fn_stdet_stat))
sd(as.numeric(fn_stdet_stat))

