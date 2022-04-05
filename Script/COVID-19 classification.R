rm(list=ls())
library(randomForest)
library(dummies)
library(ggplot2)
library(devtools)
library(modeltools)
library(strucchange)
library(sandwich)
library(e1071)
library(ROCR)
library(caret)

setwd("/path to data/")
dat1<-read.table("COVID19_data.txt",header=T)# 

ds<-dat1[,-c(1:7)]

case<-ds[which(ds$Label=="COVID19"),]
control<-ds[which(ds$Label=="Non_COVID19"),]

temp<-NULL
rank<-NULL
####We here use 
for (i in 1:250) {
  set.seed(123+i) 
  case <- case[sample(1:nrow(case)), ]
  control <- control[sample(1:nrow(control)), ]
  test_df <- rbind(case[c(1:10),],control[c(1:3),])
  train_df <- rbind(case[-c(1:10),],control[-c(1:3),])
  model <- randomForest(Label~., data = train_df, ntree = 1600, importance=TRUE)
  
  p <- predict(model, test_df, type = 'prob') [,2]
  e <- prediction(p,test_df$Label)
  #auc.perf <- performance(e, measure = "aucpr")
  auc.perf <- performance(e, measure = "auc")
  print(auc.perf@y.values)
  aucpr<-auc.perf@y.values
  ass<-importance(model,type=1)
  temp<-cbind(aucpr,temp)
  rank<-cbind(ass,rank)
}


write.table(temp1,"CDVID19_performance.txt",sep="\t")
write.table(rank,"CDVID19_rank.txt",sep="\t")
