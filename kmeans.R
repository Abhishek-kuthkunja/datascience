library(readxl)
kmeanss <- read_excel("C:/Users/abhis/OneDrive/Desktop/kmeans.xlsx")
View(kmeanss)

library(cluster)
library(ClusterR)

kmeansmodel<-kmeans(kmeanss,centers=3)
summary(kmeansmodel)

print(kmeansmodel$cluster)

clusplot(kmeanss,kmeansmodel$cluster)



#heirarchial
library(ggplot2)
distma<-dist(kmeanss,method="euclidean")
distma
model1<-hclust(distma,method="average")
plot(model1)
rect.hclust(model1,k=3)

