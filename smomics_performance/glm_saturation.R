### Reads in molecules_saturation_curves to build a GLM #### 
# Loading libraries
suppressMessages(suppressWarnings(library(ResourceSelection,warn.conflicts = F, quietly = T)))
suppressMessages(suppressWarnings(library(glmmTMB,warn.conflicts = F, quietly = T)))

# set wd
path <- '/Users/svickovi/Desktop/smomics_data' # set path to results directory

# Generate glm for sm vs st (umis total)
all_files = read.table(file.path(path, 'sm_st_unique_molecules.csv'), sep = ",", header = T)
all_files$Unique_molecules = all_files$Unique_molecules/max(all_files$Unique_molecules)
plot(all_files$Prop_annot_reads, all_files$Unique_molecules, col = 'black')

# check with glm 
fit <- glm(Unique_molecules ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=binomial())
summary(fit) #display results

#check model fit 
hoslem.test(all_files$Unique_molecules, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# check with mixed mm
fit <- glmmTMB(Unique_molecules ~ Condition+offset(log10(Prop_annot_reads)),
               data=all_files,
               family=binomial)
summary(fit) #display results

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (umis per spot)
all_files = read.table(file.path(path, 'sm_st_unique_molecules.csv'), sep = ",", header = T)
all_files$norm.uniq.mol = all_files$norm.uniq.mol/max(all_files$norm.uniq.mol)
plot(all_files$Prop_annot_reads, all_files$norm.uniq.mol, col = 'black')

# check with glm 
fit <- glm(norm.uniq.mol ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=binomial())
summary(fit) #display results

#check model fit 
hoslem.test(all_files$norm.uniq.mol, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# check with mixed mm
fit <- glmmTMB(norm.uniq.mol ~ Condition+offset(log10(Prop_annot_reads)),
               data=all_files,
               family=binomial)
summary(fit) #display results

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# Generate glm for sm vs st (genes per spot)
all_files = read.table(file.path(path, 'sm_st_genes.csv'), sep = ",", header = T)
all_files$Genes = all_files$Genes/max(all_files$Genes)
all_files
plot(all_files$Prop_annot_reads, all_files$Genes, col = 'black')

# check with glm 
fit <- glm(Genes ~ Condition, offset = log(Prop_annot_reads), data=all_files, family=binomial())
summary(fit) #display results

#check model fit 
hoslem.test(all_files$Genes, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# check with mixed mm
fit <- glmmTMB(Genes ~ Condition+offset(log10(Prop_annot_reads)),
               data=all_files,
               family=binomial)
summary(fit) #display results

#repeat for sm vs visium umis
all_files = read.table(file.path(path, 'sm_visium_unique_molecules.csv'), sep = ",", header = T)
all_files$norm.uniq.mol = all_files$norm.uniq.mol/max(all_files$norm.uniq.mol)
plot(all_files$Prop_annot_reads, all_files$norm.uniq.mol, col = 'black')

# check with glm 
fit <- glm(norm.uniq.mol ~ type, offset = log(Prop_annot_reads), data=all_files, family=binomial())
summary(fit) #display results

#check model fit 
hoslem.test(all_files$norm.uniq.mol, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# check with mixed mm
fit <- glmmTMB(norm.uniq.mol ~ type+offset(log10(Prop_annot_reads)),
               data=all_files,
               family=binomial)
summary(fit) #display results

#repeat for sm vs visium genes
all_files = read.table(file.path(path, 'sm_visium_unique_genes.csv'), sep = ",", header = T)
all_files$Genes = all_files$Genes/max(all_files$Genes)
plot(all_files$Prop_annot_reads, all_files$Genes, col = 'black')

# check with glm 
fit <- glm(Genes ~ type, offset = log(Prop_annot_reads), data=all_files, family=binomial())
summary(fit) #display results

#check model fit 
hoslem.test(all_files$Genes, fitted(fit)) # high p-value (p>0.05) indicates no difference between model and data

## add points for fitted curve
points(all_files$Prop_annot_reads, fit$fitted.values, col = 'red')

# check with mixed mm
fit <- glmmTMB(Genes ~ type+offset(log10(Prop_annot_reads)),
               data=all_files,
               family=binomial)
summary(fit) #display results
