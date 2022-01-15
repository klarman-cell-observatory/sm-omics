###This script runs estimates reproducibility in Cy3-based signlas (ie. expression footprints) in SM-Omics or ST based data.
## This script recreates histograms in figures FigS2: F-G in SM-Omics: An automated platform for high-throughput spatial multi-omics; doi: https://doi.org/10.1101/2020.10.14.338418 

# set warnings
options(warn=-1)

# raw data files needed to run are available at SCP: https://singlecell.broadinstitute.org/single_cell/study/SCP979/
# please download cy3_replication_signals.zip

#load libraries
library(scales)
library(ggplot2)
library(viridis)
library(coin)

# List files
setwd("/Users/sanjavickovic/Desktop/smomics_data")
fl = list.files("./", "*signals.csv")
fl
# Plot
#pdf("Part0_replication_C1_vs_C2.pdf", useDingbats = F)
#par(mai=rep(1,1,1,1)) # no margins
flmnm=""
#layout(matrix(1:12, ncol=3, byrow=TRUE))
i=0
for (f in fl){
  i=i+1
  if (i<length(fl)){
    
    if (sapply(strsplit(fl[i], split = "\\."),"[[", 1) == sapply(strsplit(fl[i+1], split = "\\."),"[[", 1)){
      signals1=read.delim(fl[i])$X0
      signals2=read.delim(fl[i+1])$X0
      
      # make histograms
      h1 <- hist(signals1, breaks = 50)
      h2 <- hist(signals2, breaks = 50)
      
      # Find max
      mx = 0
      if (max(h1$counts)>max(h2$counts)) mx=max(h1$counts) else mx=max(h2$counts)
      
      # plot histogram
      #hist(signals1, ylim=c(0, mx), col = alpha("red", 0.2), main = paste(fl[i],fl[i+1], sep="\n"), breaks = 50)
      #hist(signals2, ylim=c(0, mx),  col = alpha("blue", 0.2), add = T, breaks = 50)
      
      # collect data for perm-test
      x1 = h1$counts
      y1 = h2$counts
      DV <- c(x1, y1)
      IV <- factor(rep(c(fl[i], fl[i+1]), c(length(x1), length(y1))))
      
      # print wilcoxons and perm-test results
      print(paste(i,fl[i],fl[i+1], wilcox.test(h1$counts, h2$counts, var.equal=TRUE)$p.value))#,pvalue(oneway_test(DV ~ IV, alternative="two.sided",distribution=approximate(B=9999))), sep =" "))

      # collect file names
      flmnm = c(flmnm, fl[i], fl[i+1])
    }
  }
  else{next}
}
flmnm = flmnm[-1]
#dev.off()

# Plot
# pdf("Part0_replication_Reps.pdf", useDingbats = F)
#par(mai=rep(1,1,1,1)) # no margins
#layout(matrix(1:12, ncol=3, byrow=TRUE))
fl = list.files("./", glob2rx("*signals.csv"))
fl = fl[grepl("Pos+\\d+_Cy3.C2", list.files("./", glob2rx("*signals.csv")))]
fl = fl[1:3]

for (i in 1:length(fl)){
  
  if (i==length(fl)){
    a=i
    b=1
  } else{
    a=i
    b=i+1
  }
  
  signals1=read.delim(fl[a])$X0
  signals2=read.delim(fl[b])$X0
  
  # make histograms
  h1 <- hist(signals1, breaks = 50)
  h2 <- hist(signals2, breaks = 50)
  
  # Find max
  mx = 0
  if (max(h1$counts)>max(h2$counts)) mx=max(h1$counts) else mx=max(h2$counts)
  
  # plot histogram
  #hist(signals1, ylim=c(0, mx), col = alpha("red", 0.2), main = paste(fl[a],fl[b], sep="\n"), breaks = 50)
  #hist(signals2, ylim=c(0, mx),  col = alpha("blue", 0.2), add = T, breaks = 50)
  
  # collect data for perm-test
  x1 = h1$counts
  y1 = h2$counts
  DV <- c(x1, y1)
  IV <- factor(rep(c(fl[a], fl[b]), c(length(x1), length(y1))))
  
  # print wilcoxons and perm-test results
  print(paste(i,fl[a],fl[b], wilcox.test(h1$counts, h2$counts, var.equal=TRUE)$p.value))#,pvalue(oneway_test(DV ~ IV, alternative="two.sided",distribution=approximate(B=9999))), sep =" "))
  
}
# dev.off()

# Plot
# pdf("Part0_replication_Runs.pdf", useDingbats = F)
#par(mai=rep(1,1,1,1)) # no margins
#layout(matrix(1:12, ncol=3, byrow=TRUE))
fl = list.files("./", glob2rx("*Rep*signals.csv"))
fl
for (i in 1:length(fl)){
  
  if (i==length(fl)){
    a=i
    b=1
  } else{
    a=i
    b=i+1
  }
  
  signals1=read.delim(fl[a])$X0
  signals2=read.delim(fl[b])$X0
  
  # make histograms
  h1 <- hist(signals1, breaks = 50)
  h2 <- hist(signals2, breaks = 50)
  
  # Find max
  mx = 0
  if (max(h1$counts)>max(h2$counts)) mx=max(h1$counts) else mx=max(h2$counts)
  
  # plot histogram
  #hist(signals1, ylim=c(0, mx), col = alpha("red", 0.2), main = paste(fl[a],fl[b], sep="\n"), breaks = 50)
  #hist(signals2, ylim=c(0, mx),  col = alpha("blue", 0.2), add = T, breaks = 50)
  
  # collect data for perm-test
  x1 = h1$counts
  y1 = h2$counts
  DV <- c(x1, y1)
  IV <- factor(rep(c(fl[a], fl[b]), c(length(x1), length(y1))))
  
  # print wilcoxons and perm-test results
  print(paste(i,fl[a],fl[b], wilcox.test(h1$counts, h2$counts, var.equal=TRUE)$p.value))#,pvalue(oneway_test(DV ~ IV, alternative="two.sided",distribution=approximate(B=9999))), sep =" "))
  
  
}
# dev.off()
