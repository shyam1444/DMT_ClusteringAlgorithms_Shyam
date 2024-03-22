# Load required libraries
library(cluster)
library(tidyverse)
library(factoextra)
library(carData)

# Read the data from CSV file
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Select relevant columns for clustering
data <- df[, c("Latitude", "Longtude")]

# Perform CLARA clustering with k=2
clara_result <- clara(data, k = 2)

# Determine optimal number of clusters using the "wss" method
optimal_clusters <- fviz_nbclust(data, FUNcluster = clara, method = "wss")  
print(optimal_clusters)

# Perform CLARA clustering with k=2
clara.res <- clara(df, 2, metric = "euclidean", stand = TRUE, correct.d = FALSE)
print(clara.res)

# Attach cluster labels to the original dataframe
dd = data.frame(df,clara.res$cluster)
dd
view(dd)

# Filter out constant columns
constant_columns <- sapply(df, function(x) length(unique(x)) <= 1)
df_filtered <- df[, !constant_columns]

#The clusters count is 2 from the optimal clusters function
clara_res_filtered <- clara(df_filtered, k = 2)

# Visualize the clusters
fviz_cluster(clara_res_filtered, data = df_filtered)
