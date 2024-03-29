library(ggplot)
library(ggplot2)
library(tidyverse)
library(readr)
library(tidyr)
library(dplyr)
library(corrplot)
library(tidymodels)  # For nearest_neighbor and workflows functions
library(kknn)

# Read csv file
df <- read.csv("auto-mpg.csv")

# Convert 'displacement' from cubic inches to cubic centimeters
df$displacement <- df$displacement * 16.387  # 1 cubic inch = 16.387 cubic centimeters

# Check for missing values in the entire dataframe
missing_values <- is.na(df)

# Summarize the total number of missing values in each column
colSums(df == "?")

# Replace '?' with '0' in the entire dataframe
df[df == '?'] <- '0'
df$horsepower

p <- mean(as.numeric(df$horsepower))
p

df[df == '0'] <- p

# Convert the 'horsepower' column to numeric
df$horsepower <- as.numeric(df$horsepower)

df$horsepower


# Checking for outliers using boxplots for all attributes
options(repr.plot.width=10, repr.plot.height=6) # Set plot size

# Create a list to store the outlier detection plots
plots <- list()

# Iterate through each column and create boxplot for outlier detection
for (col in names(df)) {
  if (is.numeric(df[[col]])) {
    plot <- ggplot(df, aes(y = !!sym(col))) +
      geom_boxplot() +
      labs(title = paste("Boxplot for", col))
    plots[[col]] <- plot
  }
}

# Arrange and print the outlier detection plots
library(gridExtra)
grid.arrange(grobs = plots, ncol = 2)  # Change the number of columns if needed


# Define a function to remove outliers using IQR
remove_outliers <- function(dataframe, columns, threshold = 1.5) {
  for (col in columns) {
    if (is.numeric(dataframe[[col]])) {
      Q1 <- quantile(dataframe[[col]], 0.25)
      Q3 <- quantile(dataframe[[col]], 0.75)
      IQR <- Q3 - Q1
      upper_limit <- Q3 + threshold * IQR
      lower_limit <- Q1 - threshold * IQR
      
      # Remove rows with values outside the upper and lower limits
      dataframe <- dataframe[dataframe[[col]] >= lower_limit & dataframe[[col]] <= upper_limit, ]
    }
  }
  return(dataframe)
}

# List of columns to check for outliers (numeric columns only)
numeric_columns <- names(df)[sapply(df, is.numeric)]

# Remove outliers using the remove_outliers function
df_no_outliers <- remove_outliers(df, numeric_columns)

# Check the dimensions of the resulting dataframe
dim(df_no_outliers)

# 3. Conduct Exploratory Analysis
summary(df_no_outliers)

#Correlation plot
newdata <- cor(df_no_outliers[ , c('mpg','weight', 'displacement', 'horsepower', 'acceleration')], use='complete')
corrplot(newdata, method = "number")

#Scatterplot
df_no_outliers$model.year = df_no_outliers$model.year %>%
  factor(labels = sort(unique(df_no_outliers$model.year)))

ggplot(df_no_outliers,aes(model.year,mpg)) +
  geom_point()

#'mpg' based on 'origin'
ggplot(df_no_outliers, aes(x = origin, y = mpg)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(x = "Origin", y = "Mean Miles per Gallon")

#'horsepower' based on 'origin'
ggplot(df_no_outliers, aes(x = origin, y = horsepower)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(x = "Origin", y = "horsepower")

#'Weight' based on 'mpg'
ggplot(df_no_outliers,aes(weight,mpg)) +
  geom_point()+
  geom_smooth(method=lm)


# Remove rows with missing values in the "horsepower" column
df_no_outliers <- df_no_outliers[df_no_outliers$horsepower != "?", ]

# Convert "horsepower" from character to numeric
df_no_outliers$horsepower <- as.numeric(df_no_outliers$horsepower)

# Check the structure of the dataset
str(df_no_outliers)


set.seed(123)  # For reproducibility
install.packages("caTools")

library(caTools)  # Load the caTools library for the sample.split function

split = sample.split(df_no_outliers$mpg, SplitRatio = 0.7)
train_data = df_no_outliers[split, ]
test_data = df_no_outliers[!split, ]


# Build a linear regression model
model <- lm(mpg ~ cylinders + displacement + horsepower + weight + acceleration + model.year + origin, data = train_data)

# Train the model
summary(model)  # View model summary

# Predict using the test set
predictions <- predict(model, newdata = test_data)

# Evaluate the model (e.g., calculate Mean Squared Error)
mse <- mean((test_data$mpg - predictions)^2)
print(paste("Mean Squared Error:", mse))

# Calculate the Root Mean Squared Error (RMSE)
rmse <- sqrt(mse)

# Calculate the Mean Absolute Error (MAE)
mae <- mean(abs(test_data$response_var - predictions))

# Print the evaluation metrics
cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")
cat("Mean Absolute Error (MAE):", mae, "\n")

plot(test_data$mpg, predictions, xlab = "Actual MPG", ylab = "Predicted MPG", main = "Actual vs. Predicted MPG")
abline(0, 1, col = "red")  # Add a diagonal line for comparison
# Calculate the R-squared (R^2) score
summary(model)$r.squared


# Load the necessary library (if not already loaded)
library(stats)

# Assuming you have already loaded your dataset as "df" and have selected the relevant columns for clustering
# For example, you might want to cluster based on attributes like "cylinders," "displacement," "horsepower," "weight," etc.

# Select the columns for clustering
cluster_data <- df_no_outliers[, c("cylinders", "displacement", "horsepower", "weight")]

# Determine the number of clusters (you can choose this based on domain knowledge or use techniques like the Elbow Method)
k <- 3  # You can change the number of clusters as needed

# Perform K-means clustering
kmeans_model <- kmeans(cluster_data, centers = k)

# Get cluster assignments for each data point
cluster_assignments <- kmeans_model$cluster

# Add the cluster assignments back to your dataset
df_no_outliers$cluster <- cluster_assignments

# View the cluster assignments
table(df_no_outliers$cluster)

# Now, you can analyze the characteristics of each cluster
cluster_centers <- kmeans_model$centers
print(cluster_centers)

# Calculate inertia (within-cluster sum of squares) for the k-means model
inertia <- kmeans_model$tot.withinss
print(paste("Inertia (Within-cluster sum of squares):", inertia))

# Bar graph between MPG and Cylinders
ggplot(data = df_no_outliers, aes(x = as.factor(cylinders), y = mpg)) +
  geom_bar(stat = "summary", fun = "mean", fill = "pink", color = "black") +
  labs(title = "Average mpg by Cylinders", x = "Cylinders", y = "Average MPG")


# Box plot for MPG by Model Year
ggplot(data = df_no_outliers, aes(x = as.factor(model.year), y = mpg)) +
  geom_boxplot(fill = "orange") +
  labs(title = "MPG by Model Year", x = "Model Year", y = "MPG")

# Bar chart between Model Year and Origin
ggplot(data = df_no_outliers, aes(x = as.factor(model.year), fill = as.factor(origin))) +
  geom_bar(position = "dodge") +
  labs(title = "Distribution of Cars by Model Year and Origin", x = "Model Year", y = "Count", fill = "Origin") +
  theme_minimal()

