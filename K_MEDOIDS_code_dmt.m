# Load the dataset
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Extract relevant columns
X <- df[, c('Latitude', 'Longtude')]  # Corrected column name 'Longitude'

# Perform K-medoids clustering
library("cluster")
numClusters <- 2
distances <- dist(X, method = "manhattan")
kmedoids_model <- pam(distances, k = numClusters)

# Visualize the clusters
plot(X$Latitude, X$Longtude, col = kmedoids_model$clustering, pch = 19, main = paste('K-medoids Clustering with', numClusters, 'Clusters'))
points(X[kmedoids_model$id.med, 'Latitude'], X[kmedoids_model$id.med, 'Longtude'], col = 1:numClusters, pch = 'x', cex = 2)
