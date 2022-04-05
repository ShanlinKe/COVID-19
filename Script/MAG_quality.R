#################### MAGs contamination and completeness #############################
rm(list=ls())
library(vegan)
library(ape)
library(ggplot2)
library(magrittr)
library(dplyr)
library(cowplot)
library(reshape2) 
library(ggExtra)
setwd("path to data/Quality")

df1<-read.table("COVID_quality.txt",header=T)
df2<-df1[which(df1$Type=="MAGs"),]
df2$Phyla <- factor(df2$Phyla, levels=unique(df2$Phyla))
scaleFUN1 <- function(x) sprintf("%.2f", x)

p1 <- ggplot(data=df2, aes(x = Completeness,y=Contamination,color=Phyla))
p1 <- p1 + geom_point(aes(size = Genome_size),alpha=1)
p1 <- p1 + geom_smooth(size=1.3,color="#4c6389",method="loess")
p1 <- p1 + theme_bw()+theme(panel.grid=element_blank(),panel.border=element_blank(),axis.line=element_line(size=1,colour="black"))
p1 <- p1 + theme(axis.text.x=element_text(colour="black",family="Times",size=6), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                 axis.text.y=element_text(colour="black",family="Times",size=8,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                 axis.title.y=element_text(family="Times",size = 10,face="plain"), #设置y轴标题的字体属性
                 panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                 legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                          size=6),
                 legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                           size=6),
                 panel.grid.minor = element_blank(),
                 panel.background = element_rect(colour = "black", size = 0.5))
p1 <- p1 + scale_colour_manual(values=c("#B2DF8A", "#33A02C","#FDBF6F", "#FF7F00", "#FB9A99", "#E31A1C",  "#1F78B4","#A6CEE3","#CAB2D6", "#6A3D9A", "#FFFF99", "#B15928", "#D95F02", "#9E1862", "#E6AB02", "#666666"))
p1 <- p1 + ylab("Contamination (%)")
p1 <- p1 + xlab("Completeness (%)")
#p1 <- p1 + theme(legend.position="none")


All1 <- plot_grid(p1,labels=c('a'),label_size = 10,ncol=1)
save_plot("COVID19_quality.pdf", All1, base_width = 9,base_height =8)
