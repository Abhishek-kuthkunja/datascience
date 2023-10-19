# Installing package 
install.packages("caTools")       # For sampling the dataset 
install.packages("randomForest")  # For implementing random forest algorithm 

# Loading package 
library(caTools) 
library(randomForest) 


# Loading data 
library(readxl)
dataset1 <- read_excel("C:/Users/abhis/OneDrive/Desktop/dataset1.xlsx")
View(dataset1)

# Structure  
str(iris) 

# Splitting data in train and test data 
split <- sample.split(dataset1$x, SplitRatio = 0.7) 
train <- subset(dataset1, split == "TRUE") 
test <- subset(dataset1, split == "FALSE") 


classifier_RF = randomForest(x = train[,1], 
                             y = train[,2], 
                             ntree = 500) 

classifier_RF 

# Predicting the Test set results 
y_pred = predict(classifier_RF, newdata = test[,1]) 
y_pred
test[,3]

# Plotting model 
plot(classifier_RF) 

# Importance plot 
importance(classifier_RF) 

# Variable importance plot 
varImpPlot(classifier_RF) 

