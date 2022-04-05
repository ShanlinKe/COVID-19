#################################  Random Forest regression ##########################
############################################ 5-fold in 50 times #####################
rm(list=ls())
library(ggplot2)
library(cowplot)
library(reshape2)
library(caret)
library(randomForest)
library(tidyverse)
library(yardstick)
library(psych)

setwd("path to data")
dat<-read.table("COVID19_data.txt",header=T)

dat1<-dat[,-c(1:4)]

temp1 <- data.frame("Predit_train" = c(1:1), "V2" = c(1:1))
temp2 <- data.frame("Predit_test" = c(1:1), "V2" = c(1:1))
temp3 <- data.frame(".metric" = c(1:1),".estimator" = c(1:1), ".estimate" = c(1:1))
temp4 <- data.frame("IncMSE" = c(5308:1))

for (i in 1:50) {
  set.seed(123+i)
  df1 <- dat1[sample(1:nrow(dat1)), ]
  n <- nrow(df1)
  train_indices <- sample(1:n)
  my_folds <- createFolds(train_indices, k=5)
  for (fold in my_folds) {
    TRAIN <- df1[-fold,]
    TEST <- df1[fold,]
    rf_model <- randomForest(Neg_qpcr ~ . , data = TRAIN, ntree= 1000, mtry=12, keep.forest=TRUE, importance=TRUE)
    
    Predit_train <- predict(rf_model, TRAIN)
    TRAIN.rf_scored <- as_tibble(cbind(TRAIN, Predit_train))
    RMSE_rf_Train <- yardstick::rmse(TRAIN.rf_scored, truth=Neg_qpcr, estimate=Predit_train)
    Score_train<-cbind(Predit_train, TRAIN$Neg_qpcr)
    Score_train<-as.data.frame(Score_train)
    temp1<-rbind(temp1, Score_train)
    i_scores <- importance(rf_model,type=1)
    names(i_scores)<-c("IncMSE")
    #i_scores <- varImp(rf_model, conditional=TRUE)
    temp4 <- cbind(i_scores, temp4)
    ######## Test 
    Predit_test <- predict(rf_model, TEST)
    TEST.rf_scored <- as_tibble(cbind(TEST, Predit_test))
    RMSE_rf_TEST <- yardstick::rmse(TEST.rf_scored, truth=Neg_qpcr, estimate=Predit_test)
    Score_test<-cbind(Predit_test, TEST$Neg_qpcr)
    Score_test<-as.data.frame(Score_test)
    temp2<-rbind(temp2,Score_test)
    temp3<-rbind(temp3,RMSE_rf_TEST)
  }
}

######
pearson1<-corr.test(temp1[-1,], method="pearson")
Cor_train<-pearson1$r
P_train<-pearson1$p

pearson2<-corr.test(temp2[-1,], method="pearson")
Cor_test<-pearson2$r
P_test<-pearson2$p

write.table(temp2,"CDVID19_regression_predicted_values.txt",sep="\t")
