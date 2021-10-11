### Reads in molecules_saturation_curves to build a GLM #### 
library(glmmTMB)
options(warn=-1)

# set wd
path <- '/Users/sanjavickovic/Desktop/smomics_data' # set path to results directory
family = stats::binomial(link = "logit")

# Generate glmm for sm vs st (umis total)
all_files = read.table(file.path(path, 'sm_st_unique_molecules.csv'), sep = ",", header = T)
all_files$Unique_molecules = all_files$Unique_molecules/(max(all_files$Unique_molecules))
plot(all_files$Prop_annot_reads, all_files$Unique_molecules, col = 'black')

# get glmm fit
fit <- glmmTMB(Unique_molecules ~ Condition + (1|Name), weights = rep(1, nrow(all_files)), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit)

#check model fit 
ht = hoslem.test(all_files$Unique_molecules, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data
print(ht$p.value)

# add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$Unique_molecules,
            mx[mx$Condition == unique(mx$Condition)[2],]$Unique_molecules, 
            alternative = c("two.sided"),
            var.equal = T)

print(paste0("t-test p-val at max saturation ... ", round(tt$p.value, 4)))

# Generate glmm for sm vs st (umis total per region)
all_files = read.table(file.path(path, 'sm_st_unique_molecules_per_region.csv'), sep = ",", header = T)

# check with glmm 
for (region in unique(all_files$Annotated_region)){
  all_files_region = all_files[all_files$Annotated_region == region,]
  all_files_region$Unique_molecules = all_files_region$Unique_molecules/max(all_files_region$Unique_molecules)
  plot(all_files_region$Prop_annot_reads, all_files_region$Unique_molecules, col = 'black', main = region)

  print(region)

  # check with mixed model
  fit <- glmmTMB(Unique_molecules ~ Condition + (1|Name), weights = rep(1, nrow(all_files_region)), offset = log(Prop_annot_reads), data=all_files_region, family=family)
  summary(fit) #display result
  
  #check model fit 
  ht = hoslem.test(all_files_region$Unique_molecules, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data
  print(ht$p.value)
  
  # add points for fitted curve
  points(all_files_region$Prop_annot_reads, fitted(fit), col = 'red')
  
  print("checking with glmm ... ")
  # print values
  if (coef(summary(fit))$cond[,4][2] < 0.1){
    print(coef(summary(fit))$cond[,1][2])
    print(coef(summary(fit))$cond[,4][2])}
  
  # print t-test
  mx = all_files_region[all_files_region$Prop_annot_reads == max(all_files_region$Prop_annot_reads),]
  tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$Unique_molecules,
              mx[mx$Condition == unique(mx$Condition)[2],]$Unique_molecules, 
              alternative = c("two.sided"))
  
  print(paste0("t-test p-val at max saturation ... ", tt$p.value))
}

# Generate glmm for sm vs visium (umis total per region)
all_files = read.table(file.path(path, 'sm_visium_unique_molecules_per_region.csv'), sep = ",", header = T)

# check with glmm 
for (region in unique(all_files$Annotated_region)){
  all_files_region = all_files[all_files$Annotated_region == region,]
  all_files_region$norm.uniq.mol = all_files_region$norm.uniq.mol/max(all_files_region$norm.uniq.mol)
  plot(all_files_region$Prop_annot_reads, all_files_region$norm.uniq.mol, col = 'black', main = region)
  
  print(region)
  # check with mixed model
  fit <- glmmTMB(norm.uniq.mol ~ Condition + (1|Name), weights = rep(1, nrow(all_files_region)), offset = log(Prop_annot_reads), data=all_files_region, family=family)
  summary(fit) #display result
  
  print("checking with glmm ... ")
  # print values
  if (coef(summary(fit))$cond[,4][2] < 1){
    print(coef(summary(fit))$cond[,1][2])
    print(coef(summary(fit))$cond[,4][2])}
  
  #check model fit 
  ht = hoslem.test(all_files_region$norm.uniq.mol, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data
  # print(ht$p.value)
  
  # add points for fitted curve
  points(all_files_region$Prop_annot_reads, fitted(fit), col = 'red')
  
  # print t-test
  mx = all_files_region[all_files_region$Prop_annot_reads == max(all_files_region$Prop_annot_reads),]
  tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$norm.uniq.mol,
              mx[mx$Condition == unique(mx$Condition)[2],]$norm.uniq.mol, 
              alternative = c("two.sided"))
  
  print(paste0("t-test p-val at max saturation ... ", tt$p.value))
  
}

# Generate glmm for sm stainings (umis per spot inside)
all_files = read.table(file.path(path, 'sm_stainings_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)

# check with glmm 
conds = rbind(cbind("HE", "DAPI"), cbind("Nestin", "DAPI"), cbind("HE", "Nestin"))

for (i in 1:nrow(conds)){
  print(conds[i,][1])
  print(conds[i,][2])
  all_files_sub = all_files[(all_files$Condition == conds[i,][1]) | (all_files$Condition == conds[i,][2]),]
  
  # check with mixed model
  fit <- glmmTMB(UMI.inside ~ Condition + (1|Name), weights = rep(1, nrow(all_files_sub)), offset = log(Prop_annot_reads), data=all_files_sub, family=family)
  summary(fit) #display result
  
  print("checking with glmm ... ")
  # print values
  if (coef(summary(fit))$cond[,4][2] < 1){
    print(coef(summary(fit))$cond[,1][2])
    print(coef(summary(fit))$cond[,4][2])}
  
  #check model fit 
  ht = hoslem.test(all_files_sub$UMI.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data
  # print(ht$p.value)
  
  # print t-test
  mx = all_files_sub[all_files_sub$Prop_annot_reads == max(all_files_sub$Prop_annot_reads),]
  tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$UMI.inside,
              mx[mx$Condition == unique(mx$Condition)[2],]$UMI.inside, 
              alternative = c("two.sided"))
  
  print(paste0("t-test p-val at max saturation ... ", tt$p.value))
  
}

# Generate glmm for sm stainings (umis per spot outside)
all_files = read.table(file.path(path, 'sm_stainings_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.outside = all_files$UMI.outside/max(all_files$UMI.outside)

for (i in 1:nrow(conds)){
  print(conds[i,][1])
  print(conds[i,][2])
  all_files_sub = all_files[(all_files$Condition == conds[i,][1]) | (all_files$Condition == conds[i,][2]),]
  
  # check with mixed model
  fit <- glmmTMB(UMI.outside ~ Condition + (1|Name), weights = rep(1, nrow(all_files_sub)), offset = log(Prop_annot_reads), data=all_files_sub, family=family)
  summary(fit) #display result
  
  print("checking with glmm ... ")
  # print values
  if (coef(summary(fit))$cond[,4][2] < 1){
    print(coef(summary(fit))$cond[,1][2])
    print(coef(summary(fit))$cond[,4][2])}
  
  #check model fit 
  ht = hoslem.test(all_files_sub$UMI.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data
  # print(ht$p.value)
  
  # print t-test
  mx = all_files_sub[all_files_sub$Prop_annot_reads == max(all_files_sub$Prop_annot_reads),]
  tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$UMI.outside,
              mx[mx$Condition == unique(mx$Condition)[2],]$UMI.outside, 
              alternative = c("two.sided"))
  
  print(paste0("t-test p-val at max saturation ... ", tt$p.value))
  
}


# Generate glmm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.outside = all_files$Genes.outside/max(all_files$Genes.outside)
plot(all_files$Prop_annot_reads, all_files$Genes.outside, col = 'black')

# check with glmm 
fit <- glmmTMB(Genes.outside ~ Condition + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results

#check model fit 
hoslem.test(all_files$Genes.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$Genes.outside,
            mx[mx$Condition == unique(mx$Condition)[2],]$Genes.outside, 
            alternative = c("two.sided"),
            var.equal = T)

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

# Generate glmm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.inside = all_files$Genes.inside/max(all_files$Genes.inside)
plot(all_files$Prop_annot_reads, all_files$Genes.inside, col = 'black')

# check with glmm
fit <- glmmTMB(Genes.inside ~ Condition + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results

#check model fit 
hoslem.test(all_files$Genes.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$Genes.inside,
            mx[mx$Condition == unique(mx$Condition)[2],]$Genes.inside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

# Generate glmm for sm vs st (umis per spot)
all_files = read.table(file.path(path, 'sm_st_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)
plot(all_files$Prop_annot_reads, all_files$UMI.inside, col = 'black')

# check with glm 
fit <- glmmTMB(UMI.inside ~ Condition + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results

#check model fit 
hoslem.test(all_files$UMI.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$UMI.inside,
            mx[mx$Condition == unique(mx$Condition)[2],]$UMI.inside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

# Generate glm for sm vs st (umis per spot)
all_files = read.table(file.path(path, 'sm_st_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.outside = all_files$UMI.outside/max(all_files$UMI.outside)
plot(all_files$Prop_annot_reads, all_files$UMI.outside, col = 'black')

# check with glm 
fit <- glmmTMB(UMI.outside ~ Condition + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results

#check model fit 
hoslem.test(all_files$UMI.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$UMI.outside,
            mx[mx$Condition == unique(mx$Condition)[2],]$UMI.outside, 
            alternative = c("two.sided"),)

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

#repeat for sm vs visium genes per spot
all_files = read.table(file.path(path, 'sm_visium_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.inside = all_files$Genes.inside/max(all_files$Genes.inside)
plot(all_files$Prop_annot_reads, all_files$Genes.inside, col = 'black')

# check with glmm 
fit <- glmmTMB(Genes.inside ~ type + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results
exp(coef(summary(fit))$cond[,1][2])
#check model fit 
hoslem.test(all_files$Genes.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$type == unique(mx$type)[1],]$Genes.inside,
            mx[mx$type == unique(mx$type)[2],]$Genes.inside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

#repeat for sm vs visium genes
all_files = read.table(file.path(path, 'sm_visium_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.outside = all_files$Genes.outside/max(all_files$Genes.outside)
plot(all_files$Prop_annot_reads, all_files$Genes.outside, col = 'black')

# check with glm 
fit <- glmmTMB(Genes.outside ~ type + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results


#check model fit 
hoslem.test(all_files$Genes.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$type == unique(mx$type)[1],]$Genes.outside,
            mx[mx$type == unique(mx$type)[2],]$Genes.outside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

#repeat for sm vs visium umis per spot
all_files = read.table(file.path(path, 'sm_visium_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)
plot(all_files$Prop_annot_reads, all_files$UMI.inside, col = 'black')

# check with glm 
fit <- glmmTMB(UMI.inside ~ type + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results
exp(coef(summary(fit))$cond[,1][2])

#check model fit 
hoslem.test(all_files$UMI.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$type == unique(mx$type)[1],]$UMI.inside,
            mx[mx$type == unique(mx$type)[2],]$UMI.inside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

#repeat for sm vs visium umis
all_files = read.table(file.path(path, 'sm_visium_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.outside = all_files$UMI.outside/max(all_files$UMI.outside)
plot(all_files$Prop_annot_reads, all_files$UMI.outside, col = 'black')

# check with glm 
fit <- glmmTMB(UMI.outside ~ type + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results

#check model fit 
hoslem.test(all_files$UMI.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads,  fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$type == unique(mx$type)[1],]$UMI.outside,
            mx[mx$type == unique(mx$type)[2],]$UMI.outside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

#repeat for sm vs st cancer umis per spot
all_files = read.table(file.path(path, 'sm_st_unique_molecules_under_outside_tissue_cancer.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)
plot(all_files$Prop_annot_reads, all_files$UMI.inside, col = 'black')

# check with glmm
fit <- glmmTMB(UMI.inside ~ Condition + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results

#check model fit 
hoslem.test(all_files$UMI.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$UMI.inside,
            mx[mx$Condition == unique(mx$Condition)[2],]$UMI.inside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))

#repeat for sm vs st cancer genes per spot
all_files = read.table(file.path(path, 'sm_st_unique_genes_under_outside_tissue_cancer.csv'), sep = ",", header = T)
all_files$Genes.inside = all_files$Genes.inside/max(all_files$Genes.inside)
plot(all_files$Prop_annot_reads, all_files$Genes.inside, col = 'black')

# check with glm 
fit <- glmmTMB(Genes.inside ~ Condition + (1|Name), offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit) #display results

#check model fit 
hoslem.test(all_files$Genes.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fitted(fit), col = 'red')

# print t-test
mx = all_files[all_files$Prop_annot_reads == max(all_files$Prop_annot_reads),]
tt = t.test(mx[mx$Condition == unique(mx$Condition)[1],]$Genes.inside,
            mx[mx$Condition == unique(mx$Condition)[2],]$Genes.inside, 
            alternative = c("two.sided"))

print(paste0("t-test p-val at max saturation ... ", tt$p.value))