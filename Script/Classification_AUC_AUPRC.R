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

setwd("/path to data/")
df0<-read.table("COVID19_data.txt",header=T)
scaleFUN2 <- function(x) sprintf("%.2f", x)

p01 <- ggplot(data=df0, aes(x = ID1,y=Out1,fill=ID1))
p01 <- p01 + geom_boxplot(outlier.alpha = 0.1,width=0.2,outlier.size=0.4,fatten=2)
p01 <- p01 + theme(plot.background=element_blank(),panel.background=element_blank())
p01 <- p01 + theme_bw()
p01 <- p01 + theme(axis.text.x=element_text(colour="black",family="Times",size=8), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                   axis.text.y=element_text(colour="black",family="Times",size=8,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                   axis.title.y=element_text(family="Times",size = 10,face="plain"), #设置y轴标题的字体属性
                   axis.title.x=element_text(family="Times",size = 10,face="plain"), 
                   panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                   legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                            size=6),
                   legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                             size=6),
                   panel.grid.major = element_blank(),   #不显示网格线
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(colour = "black", size = 0.5))

p01 <- p01 + scale_fill_brewer(palette = "Paired")
p01 <- p01 + scale_color_brewer(palette = "Paired")
p01 <- p01 + ylab("COVID-19 vs Non-COVID-19")
p01 <- p01 + xlab("Group")
p01 <- p01 + theme(legend.position="none")
p01 <- p01 + ggtitle("Zuo et al.") 

p02 <- ggplot(data=df0, aes(x = ID2,y=Out2,fill=ID2))
p02 <- p02 + geom_boxplot(outlier.alpha = 0.1,width=0.2,outlier.size=0.4,fatten=2)
p02 <- p02 + theme(plot.background=element_blank(),panel.background=element_blank())
p02 <- p02 + theme_bw()
p02 <- p02 + theme(axis.text.x=element_text(colour="black",family="Times",size=8), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                   axis.text.y=element_text(colour="black",family="Times",size=8,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                   axis.title.y=element_text(family="Times",size = 10,face="plain"), #设置y轴标题的字体属性
                   axis.title.x=element_text(family="Times",size = 10,face="plain"), 
                   panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                   legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                            size=6),
                   legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                             size=6),
                   panel.grid.major = element_blank(),   #不显示网格线
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(colour = "black", size = 0.5))

p02 <- p02 + scale_fill_brewer(palette = "Paired")
p02 <- p02 + scale_color_brewer(palette = "Paired")
p02 <- p02 + ylab("COVID-19 vs Non-COVID-19")
p02 <- p02 + xlab("Group")
p02 <- p02 + theme(legend.position="none")
p02 <- p02 + ggtitle("Yeoh et al.") 

plot1 <- plot_grid(p01, p01, labels=c('a',''),label_size = 12,ncol=2,rel_widths = c(0.7, 1.3))
plot2 <- plot_grid(p02, p02, labels=c('c',''),label_size = 12,ncol=2,rel_widths = c(0.7, 1.3))
plot3 <- plot_grid(plot1, plot2,  labels=c('','',''),label_size = 12,ncol=1)

save_plot("COVID19_Fig.pdf", plot4, base_width = 14,base_height =15)
