# Load file data
GeneData.table=read.delim("GeneData.txt")
# Remove first 2 columns seq no and ID
GeneData=GeneData.table[,-c(1,2)]
# Normalize the data
GeneData.s=scale(GeneData,center=TRUE,scale=TRUE)
# View Gene data
GeneData.s
# Perform labeling
X=c("seq1","seq2","seq3","seq4","seq5","seq6","seq7","seq8","seq9","seq10")
# Hierarichal clustering use GeneData.s to use standardized data
geneclust=hclust(dist(GeneData.s), method="average")
# Plot, create dendogram
plot(geneclust,labels=X,cex=1,hang=-2)
# Find correlation 
GeneData.cor=cor(GeneData)
# print GeneData.cor -see A and C are 100% corelated
GeneData.cor
# Eigenvalues and Eigenvectors  - eigen-german, means charecteristic root
GeneData.eig=eigen(GeneData.cor)
# Display Eigenvalues and Eigenvectors, Sum of all Eigenvalues = number of features
GeneData.eig
# make it a look a bit nice
GeneData.eigval=cbind(GeneData.eig$values)
# Check the sum - not neceassary jut to double check
sum(GeneData.eigval)
# Find PrGeneDAta - Proportion of gene data 
PrGeneData.eigenval=GeneData.eigval/sum(GeneData.eigval)
# View Proportions Data - we see that 72% of data is explained by first and 27 by second component
PrGeneData.eigenval
# Find cumulative sum of PCs
cumsum(PrGeneData.eigenval)
# Scree Plot - shows that 2 PCs we have 100% of the data
plot(PrGeneData.eigenval)
# Similarly plot for cumulative sum
plot(cumsum(PrGeneData.eigenval))
# To find the projected data - g. Computing the values on the new axes (PCs) 
# They are linear combination (weighted sum) of original values
# Matrix multiplication - %*% >> matrix multiplication
GeneData.new=GeneData.s%*%GeneData.eig$vectors
# View transformed data
GeneData.new
# Add column names to the whole thing
colnames(GeneData.new)=c("PC1","PC2","PC3","PC4")
# Again View transformed data
GeneData.new
# Clustering the recuced number of dimensions - RD
GeneData.RD=GeneData.new[,c(1,2)]
geneclust=hclust(dist(GeneData.RD),method="average")
plot(geneclust,labels=X,cex=1,hang=-2)


# wine data analysis
# if first 2 PC do no explain 75% then how many PCs are needed?
# check if results are same in matlab and R
# to find wards average use method wards.d2


