# Load necessary libraries
library(fpc)
library(dendextend)

# Load your dataset
df = read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Specify the columns to be used for clustering (Latitude and Longitude)
data_attributes <- data[, c("Latitude", "Longtude")]

# Perform DBSCAN clustering on the Latitude and Longitude attributes
dbscan_result <- dbscan(data_attributes, eps = 0.5, MinPts = 5)

# Hierarchical clustering using Euclidean distance
dist_matrix <- dist(data_attributes)
hc <- hclust(dist_matrix, method = "ward.D2")

# Plot dendrogram
dend <- as.dendrogram(hc)
plot(dend)

# Plot DBSCAN clusters
plot(dbscan_result, data_attributes)