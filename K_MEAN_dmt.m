# Load the dataset
df = read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Extract relevant columns
X <- data[, c('pincode', 'Latitude', 'Longtude')]

# Convert pincode to categorical data
X$pincode <- as.factor(X$pincode)

# Perform K-means clustering
numClusters <- 3
kmeans_model <- kmeans(X[, c('Latitude', 'Longtude')], centers = numClusters)

# Visualize the clusters
plot(X$Latitude, X$Longitude, col = kmeans_model$cluster, pch = 19, main = paste('K-means Clustering with', numClusters, 'Clusters'))
points(kmeans_model$centers[,1], kmeans_model$centers[,2], col = 1:numClusters, pch = 'x', cex = 2)
legend("topright", legend=paste("Cluster", 1:numClusters), col=1:numClusters, pch='x')
