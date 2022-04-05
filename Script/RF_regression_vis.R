rm(list=ls())
library(ggplot2)
library(cowplot)
library(reshape2)
library(caret)
library(randomForest)
library(tidyverse)
library(yardstick)
library(psych)
library(plyr)
library(dplyr)


setwd("path to data")
df1<-read.table("COVID19_data.txt",header=T)

scaleFUN2 <- function(x) sprintf("%.2f", x)

p01<- ggplot(df1, aes(x=Truths,y=Predit_test))
p01 <- p01 + geom_point(size=0.8,color="#0A5A87",alpha=0.8)
p01 <- p01 + geom_smooth(method=lm,color="#fa9fb5", fill="#FDBF6F",size=1)
p01 <- p01 + theme_bw()
p01 <- p01 + xlab("Truth (days of neg qPCR)")+ylab("Prediction (days of neg qPCR)")+theme(panel.grid=element_blank())
p01 <- p01 + theme(legend.key.size = unit(0.3, "cm"))
p01 <- p01 + theme(axis.text.x=element_text(colour="black",family="Times",size=8), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                   axis.text.y=element_text(colour="black",family="Times",size=8,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                   axis.title.x=element_text(family="Times",size = 10,face="plain"),
                   axis.title.y=element_text(family="Times",size = 10,face="plain"),
                   legend.position="none",
                   panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                   legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                            size=6),
                   legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                             size=6),
                   panel.grid.major = element_blank(),   #不显示网格线
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(colour = "black", size = 0.5),
                   plot.title = element_text(hjust=0.5,vjust = - 8,size = 10))
p01 <- p01 + theme(legend.position="none")
p01 <- p01 + ggtitle("Pearson= 0.425 (p<1e-30)")

plot1 <- plot_grid(p01, p01, labels=c('a',''),label_size = 12,ncol=2,rel_widths = c(0.7, 1.3))

save_plot("COVID19_figure.pdf", plot1, base_width = 14,base_height =15)
