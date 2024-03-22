# Load the 'fpc' package for the dbscan function
library(fpc)

# Load the dataset with the listed attributes
data2 <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Extract the Latitude and Longitude columns for clustering
data_attributes <- data2[, c("Latitude", "Longtude")]

# Perform DBSCAN clustering on the Latitude and Longitude attributes
result2 <- dbscan(data_attributes, eps = 0.5, MinPts = 5)

# Print and plot the clustering result for the second dataset
print(result2$cluster)
plot(result2, data_attributes)