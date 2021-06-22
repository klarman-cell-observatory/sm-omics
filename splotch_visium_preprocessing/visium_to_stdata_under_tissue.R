### Visium stdata to SpoTeR stdata_under_tissue_format### 
# read in convert gene ids from spotter functions
convert.gene.ids = function(my.data){
  
  # Load genenames from input stdata.tsv matrix
  id = colnames(my.data)
  coors = row.names(my.data) # save coordinate names

  # check which species ID and check if ensembl id
  df=read.delim(paste0('/Users/svickovi/Desktop/SpoTter/STaut/spotter/data/Gene_names_mm.txt'), row.names = 1, header = T)

  # clean up dots in gene names 
  df[,1] = sapply(strsplit(row.names(df), split="_"), "[[",2)
  row.names(df) = sapply(strsplit(row.names(df), split="_"), "[[",1)
  row.names(df) = gsub("\\..*","", row.names(df))
  colnames(df) = "nm_refseq"
  
  # subset to name same genes as mm10
  colnames(my.data) = gsub("\\..*","", colnames(my.data))
  my.data = my.data[,colnames(my.data) %in% row.names(df)]
  id = colnames(my.data)
  coors = row.names(my.data) # save coordinate names
  
  # Check for name pairs
  ssg= ""
  for (genen in id){
    if (!is.na(df[genen,])){
      ssg = c(ssg, as.character(df[genen,]))
    }
    else {ssg = c(ssg, genen)}
  }
  ssg = ssg[-1]
  
  # Rename things in original matrix
  colnames(my.data) = ssg
  row.names(my.data) = coors

  # Save modified matrices with correct gene names
  return(my.data)
}

# list clouple files 
fl = list.files("/Users/svickovi/Desktop", glob2rx("visium*annotations.txt"))

# make spotter format and output 
for (f in fl){
  
  #read in file
  annotations = read.delim(paste0("/Users/svickovi/Desktop/", f), sep = "\t", header = T)
  
  #read in file
  stdata = read.delim(paste0("/Users/svickovi/Desktop/smomics_data/", strsplit(f, "_annotations.txt")[[1]], "_stdata.tsv"), sep = "\t", header = T, row.names = 1)
 
  # transform gene names
  stdata_geneids = convert.gene.ids(stdata)
  yy = sapply(strsplit(row.names(stdata_geneids), "x"), "[[",1)
  xx = sapply(strsplit(row.names(stdata_geneids), "x"), "[[",2)
  row.names(stdata_geneids) = paste0(xx, "_", yy)
  print(max(as.numeric(sapply(strsplit(row.names(stdata_geneids), "_"), "[[",1))))
  
  # subset stdata to have only annotated spots
  stdata_geneids = stdata_geneids[row.names(stdata_geneids) %in% annotations$x_y,]
  print(nrow(stdata_geneids) == length(annotations$x_y))
  print(max(as.numeric(sapply(strsplit(row.names(stdata_geneids), "_"), "[[",1))))
  print(max(annotations$x))

  # t(stdata)
  stdata_geneids_t = t(stdata_geneids)
  
  # check if all names are unique 
  if (nrow(stdata_geneids_t) != length(unique(row.names(stdata_geneids_t)))){
    print('adjusting gene names')
    print(nrow(stdata_geneids_t))
    stdata_geneids_t = stdata_geneids_t[!duplicated(row.names(stdata_geneids_t)), ]
    print(nrow(stdata_geneids_t))
  }
  max(as.numeric(sapply(strsplit(colnames(stdata_geneids_t), "_"), "[[", 1)))- min(as.numeric(sapply(strsplit(colnames(stdata_geneids_t), "_"), "[[", 1)))
  max(as.numeric(sapply(strsplit(colnames(stdata_geneids_t), "_"), "[[", 2)))- min(as.numeric(sapply(strsplit(colnames(stdata_geneids_t), "_"), "[[", 2)))
  # write celery file 
  write.table(stdata_geneids_t, file = paste0("/Users/svickovi/Desktop/", strsplit(f, "_annotations.txt")[[1]], "_stdata_under_tissue_IDs.txt"), quote = F, sep = "\t", row.names = T)
  
}



