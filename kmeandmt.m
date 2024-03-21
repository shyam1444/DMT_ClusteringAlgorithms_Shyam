% Load the dataset
data = readtable('data.csv');

% Extract relevant columns
X = data{:, {'pincode', 'Latitude', 'Longtude'}};

% Convert pincode to categorical data
pincode_categories = unique(data.pincode);
X(:, 1) = categorical(X(:, 1));

% Perform K-means clustering
numClusters = 3;
[idx, centers] = kmeans(X(:, 1:2), numClusters);

% Visualize the clusters
scatter(X(:, 1), X(:, 2), 10, pincode_categories(idx), 'filled');
hold on;
plot(centers(:, 1), centers(:, 2), 'kx', 'MarkerSize', 15, 'LineWidth', 2);
xlabel('Latitude');
ylabel('Longitude');
title(['K-means Clustering with ', num2str(numClusters), 'Clusters']);
legend('Pincode', 'Cluster Centroids');