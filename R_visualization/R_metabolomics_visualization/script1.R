# Libraries
library(readxl)
library(ggraph)
library(ggforce)
library(dendextend)
library(circlize)
library(data.table)

# load in dataframe of differential data from MSEA
df_1 = read_xlsx('../../processed/df_heatmap_GSEAtop5.xlsx')

## perform hierarchical clustering on data
# First, tranpose the dataframe such that metabolites are clustered (not the subjects)
df_1_t <- transpose(df_1)
# set first row (mouse number) as column names
names(df_1_t) <- df_1_t[1,]
# delete first row
df_1_t <- df_1_t[-1,]
row.names(df_1_t) <- colnames(df_1)[-1]

