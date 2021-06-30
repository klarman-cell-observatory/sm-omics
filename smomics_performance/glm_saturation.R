### Reads in molecules_saturation_curves to build a GLM #### 
# set wd
path <- '/Users/sanjavickovic/Desktop/smomics_data' # set path to results directory
family = stats::quasibinomial(link = "logit")

# set up all files are bernoulli dfs 
# Generate glm for sm vs st (umis total)
all_files = read.table(file.path(path, 'sm_st_unique_molecules.csv'), sep = ",", header = T)
all_files$Unique_molecules = all_files$Unique_molecules/(max(all_files$Unique_molecules)+1)
plot(all_files$Prop_annot_reads, all_files$Unique_molecules, col = 'black')

# check with glm 
fit <- glm(Unique_molecules ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

# check GOF
print(1 - pchisq(summary(fit, dispersion = 1)$deviance, summary(fit, dispersion = 1)$df.residual))

#check model fit 
hoslem.test(all_files$Unique_molecules, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (umis total per region)
all_files = read.table(file.path(path, 'sm_st_unique_molecules_per_region.csv'), sep = ",", header = T)
# check with glm 
for (region in unique(all_files$Annotated_region)){
  all_files_region = all_files[all_files$Annotated_region == region,]
  all_files_region$Unique_molecules = all_files_region$Unique_molecules/max(all_files_region$Unique_molecules)
  plot(all_files_region$Prop_annot_reads, all_files_region$Unique_molecules, col = 'black', main = region)

  print(region)
  # check with glm 
  fit <- glm(Unique_molecules ~ Condition, offset = log(Prop_annot_reads), data=all_files_region, family=family)
  summary(fit, dispersion = 1) #display results

  # print values
  if (coef(summary(fit, dispersion = 1))[,4][2] < 0.1){
    print(round(fit$coefficients[2], 2))
    print(coef(summary(fit, dispersion = 1))[,4][2])}

  #check model fit 
  ht = hoslem.test(all_files_region$Unique_molecules, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data
  #print(ht$p.value)

  # add points for fitted curve
  points(all_files_region$Prop_annot_reads, fit$fitted.values, col = 'red')

}

# Generate glm for sm vs st (umis total per region)
all_files = read.table(file.path(path, 'sm_visium_unique_molecules_per_region.csv'), sep = ",", header = T)
# check with glm 
for (region in unique(all_files$Annotated_region)){
  all_files_region = all_files[all_files$Annotated_region == region,]
  all_files_region$norm.uniq.mol = all_files_region$norm.uniq.mol/max(all_files_region$norm.uniq.mol)
  plot(all_files_region$Prop_annot_reads, all_files_region$norm.uniq.mol, col = 'black', main = region)
  
  print(region)
  # check with glm 
  fit <- glm(norm.uniq.mol ~ Condition, offset = log(Prop_annot_reads), data=all_files_region, family=family)
  summary(fit, dispersion = 1) #display results

  # print values
  if (coef(summary(fit, dispersion = 1))[,4][2] < 1){
    print(round(fit$coefficients[2], 2))
    print(coef(summary(fit, dispersion = 1))[,4][2])}
  
  #check model fit 
  ht = hoslem.test(all_files_region$norm.uniq.mol, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data
  #print(ht$p.value)
  
  # add points for fitted curve
  points(all_files_region$Prop_annot_reads, fit$fitted.values, col = 'red')
  
}

# Generate glm for sm stainings (umis per spot inside)
all_files = read.table(file.path(path, 'sm_stainings_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)
plot(all_files$Prop_annot_reads, all_files$UMI.inside, col = 'black')

# check with glm 
fit <- glm(UMI.inside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$UMI.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm stainings (umis per spot outside)
all_files = read.table(file.path(path, 'sm_stainings_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.outside = all_files$UMI.outside/max(all_files$UMI.outside)
plot(all_files$Prop_annot_reads, all_files$UMI.outside, col = 'black')

# check with glm 
fit <- glm(UMI.outside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$UMI.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.outside = all_files$Genes.outside/max(all_files$Genes.outside)
plot(all_files$Prop_annot_reads, all_files$Genes.outside, col = 'black')

# check with glm 
fit <- glm(Genes.outside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$Genes.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.inside = all_files$Genes.inside/max(all_files$Genes.inside)
plot(all_files$Prop_annot_reads, all_files$Genes.inside, col = 'black')

# check with glm 
fit <- glm(Genes.inside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$Genes.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.outside = all_files$Genes.outside/max(all_files$Genes.outside)
plot(all_files$Prop_annot_reads, all_files$Genes.outside, col = 'black')

# check with glm 
fit <- glm(Genes.outside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$Genes.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)
plot(all_files$Prop_annot_reads, all_files$UMI.inside, col = 'black')

fit <- glm(all_files$UMI.inside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1)

# check with glm 
fit <- glm(UMI.inside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$UMI.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.outside = all_files$UMI.outside/max(all_files$UMI.outside)
plot(all_files$Prop_annot_reads, all_files$UMI.outside, col = 'black')

# check with glm 
fit <- glm(UMI.outside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$UMI.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

#repeat for sm vs visium genes per spot
all_files = read.table(file.path(path, 'sm_visium_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.inside = all_files$Genes.inside/max(all_files$Genes.inside)
plot(all_files$Prop_annot_reads, all_files$Genes.inside, col = 'black')

# check with glm 
fit <- glm(Genes.inside ~ type, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$Genes.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

#repeat for sm vs visium genes
all_files = read.table(file.path(path, 'sm_visium_unique_genes_under_outside_tissue.csv'), sep = ",", header = T)
all_files$Genes.outside = all_files$Genes.outside/max(all_files$Genes.outside)
plot(all_files$Prop_annot_reads, all_files$Genes.outside, col = 'black')

# check with glm 
fit <- glm(Genes.outside ~ type, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$Genes.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

#repeat for sm vs visium umis per spot
all_files = read.table(file.path(path, 'sm_visium_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)
plot(all_files$Prop_annot_reads, all_files$UMI.inside, col = 'black')

# check with glm 
fit <- glm(UMI.inside ~ type, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$UMI.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

#repeat for sm vs visium genes
all_files = read.table(file.path(path, 'sm_visium_unique_molecules_under_outside_tissue.csv'), sep = ",", header = T)
all_files$UMI.outside = all_files$UMI.outside/max(all_files$UMI.outside)
plot(all_files$Prop_annot_reads, all_files$UMI.outside, col = 'black')

# check with glm 
fit <- glm(UMI.outside ~ type, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$UMI.outside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

#repeat for sm vs st cancer umis per spot
all_files = read.table(file.path(path, 'sm_st_unique_molecules_under_outside_tissue_cancer.csv'), sep = ",", header = T)
all_files$UMI.inside = all_files$UMI.inside/max(all_files$UMI.inside)
plot(all_files$Prop_annot_reads, all_files$UMI.inside, col = 'black')

# check with glm 
fit <- glm(UMI.inside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$Genes.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

#repeat for sm vs sm cancer genes per spot
all_files = read.table(file.path(path, 'sm_st_unique_genes_under_outside_tissue_cancer.csv'), sep = ",", header = T)
all_files$Genes.inside = all_files$Genes.inside/max(all_files$Genes.inside)
plot(all_files$Prop_annot_reads, all_files$Genes.inside, col = 'black')

# check with glm 
fit <- glm(Genes.inside ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=family)
summary(fit, dispersion = 1) #display results

#check model fit 
hoslem.test(all_files$Genes.inside, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')
