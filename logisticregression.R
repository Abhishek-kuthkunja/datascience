library(readxl)
library(ROCR)
logistic <- read_excel("C:/Users/abhis/OneDrive/Desktop/logistic.xlsx")
View(logistic)

library(caTools)
split<-sample.split(logistic$A,SplitRatio=0.7)

trainlogi<-subset(logistic,split==TRUE)
testlogi<-subset(logistic,split==FALSE)

logimodel<-glm(B~A,logistic,family="binomial")

coef(logimodel)
summary(logimodel)

logipred<-predict(model,testlogi)
logipred

logipred<-ifelse(logipred>0.5,1,0)
logipred
roc<-prediction(logipred,testlogi$B)
roc
rocper<-performance(roc,measure = "tpr",x.measure="fpr")
plot(rocper)
