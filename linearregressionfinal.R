library(readxl)
data1<- read_excel("C:/Users/abhis/OneDrive/Desktop/New Microsoft Excel Worksheet.xlsx")
View(data1)
dim(data1)
head(data1)

library(ggplot2)
ggplot(data1)+geom_point(aes(x=A,y=B))

library(caTools)
split<-sample.split(data1$A,SplitRatio = 0.5)

train<-subset(data1,split==TRUE)
test<-subset(data1,split==FALSE)

model<-lm(B~A,data1)
coef(model)

pred<-predict(model,test)
pred

library(Metrics)
rmse(test$B,pred)
ggplot()+geom_point(aes(x=train$A,y=train$B))+geom_line(aes(x=train$A,y=predict(model,train)))

