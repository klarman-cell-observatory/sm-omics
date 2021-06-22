### Visium cloupe to celery annotation transformation ### 
# Load libraries
library(stringr)

# list clouple files 
fl = list.files("/Users/svickovi/Desktop", glob2rx("visium*annotations.csv"))

# read in visium coordinate file 
barcodes = read.delim("/Users/svickovi/Desktop/visium_barcodes.txt", sep = " ", header = T, row.names = 1)
colnames(barcodes) = c("y", "x")

# make celery format and output 
for (f in fl){
  
  #read in file
  file_cloupe = read.delim(paste0("/Users/svickovi/Desktop/", f), sep = ",", header = T, row.names = 1)
  
  #transform barcodes for coordiantes
  row.names(file_cloupe) = str_replace_all(row.names(file_cloupe), "-1", "")
  tmp = merge(barcodes, file_cloupe, by=0, all=FALSE)
  
  # transform to celery format #c("image", "x_y", "x", "y", "value")
  celery = data.frame(matrix(ncol = 5, nrow = nrow(tmp)))
  colnames(celery) = c("image", "x_y", "x", "y", "value")
  celery$image = rep(strsplit(f, "_annotations.csv")[[1]], nrow(tmp))
  celery$x_y = paste0(tmp$x, "_", tmp$y)
  celery$x = tmp$x
  celery$y = tmp$y
  celery$value = tmp$Cortex

  # write celery file 
  write.table(celery, file = paste0("/Users/svickovi/Desktop/", strsplit(f, "_annotations.csv")[[1]], "_annotations.txt"), quote = F, sep = "\t", row.names = F)

}

