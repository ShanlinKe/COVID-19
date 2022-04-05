rm(list=ls())
library(betapart)
library(vegan)
library(ape)
library(ggplot2)
library(magrittr)
library(dplyr)
library(cowplot)
library(reshape2) 
library(ggExtra)
setwd("path to data")

df1<-read.table("COVID_data.txt",header=T)

df1$Bin <- factor(df1$Bin, levels=unique(df1$Bin))
df1$Phyla <- factor(df1$Phyla, levels=unique(df1$Phyla))
scaleFUN1 <- function(x) sprintf("%.2f", x)

p2 <- ggplot(data=df1, aes(x = Type,y=Completeness,fill=Type))
p2 <- p2 + geom_boxplot(outlier.alpha = 0.1,width=0.2)
p2 <- p2 + theme(plot.background=element_blank(),panel.background=element_blank())
p2 <- p2 + theme_bw()
p2 <- p2 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                 axis.text.y=element_text(colour="black",family="Times",size=10,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                 axis.title.y=element_text(family="Times",size = 12,face="plain"), #设置y轴标题的字体属性
                 axis.title.x=element_text(family="Times",size = 12,face="plain"), 
                 panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                 legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                          size=6),
                 legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                           size=6),
                 panel.grid.major = element_blank(),   #不显示网格线
                 panel.grid.minor = element_blank(),
                 panel.background = element_rect(colour = "black", size = 0.5))

p2 <- p2 + scale_fill_brewer(palette = "Paired")
p2 <- p2 + scale_color_brewer(palette = "Paired")
p2 <- p2 + ylab("Completeness (%)")
p2 <- p2 + xlab(NULL)
p2 <- p2 + theme(legend.position="none")
p2 <- p2 + scale_y_continuous(labels=scaleFUN1)

p3 <- ggplot(data=df1, aes(x = Type,y=Contamination,fill=Type))
p3 <- p3 + geom_boxplot(outlier.alpha = 0.1,width=0.2)
p3 <- p3 + theme(plot.background=element_blank(),panel.background=element_blank())
p3 <- p3 + theme_bw()
p3 <- p3 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                 axis.text.y=element_text(colour="black",family="Times",size=10,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                 axis.title.y=element_text(family="Times",size = 12,face="plain"), #设置y轴标题的字体属性
                 axis.title.x=element_text(family="Times",size = 12,face="plain"), 
                 panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                 legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                          size=6),
                 legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                           size=6),
                 panel.grid.major = element_blank(),   #不显示网格线
                 panel.grid.minor = element_blank(),
                 panel.background = element_rect(colour = "black", size = 0.5))

p3 <- p3 + scale_fill_brewer(palette = "Paired")
p3 <- p3 + scale_color_brewer(palette = "Paired")
p3 <- p3 + ylab("Contamination (%)")
p3 <- p3 + xlab(NULL)
p3 <- p3 + theme(legend.position="none")
p3 <- p3 + scale_y_continuous(labels=scaleFUN1)

p4 <- ggplot(data=df1, aes(x = Type,y=Genome_size,fill=Type))
p4 <- p4 + geom_boxplot(outlier.alpha = 0.1,width=0.2)
p4 <- p4 + theme(plot.background=element_blank(),panel.background=element_blank())
p4 <- p4 + theme_bw()
p4 <- p4 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                 axis.text.y=element_text(colour="black",family="Times",size=10,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                 axis.title.y=element_text(family="Times",size = 12,face="plain"), #设置y轴标题的字体属性
                 axis.title.x=element_text(family="Times",size = 12,face="plain"), 
                 panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                 legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                          size=6),
                 legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                           size=6),
                 panel.grid.major = element_blank(),   #不显示网格线
                 panel.grid.minor = element_blank(),
                 panel.background = element_rect(colour = "black", size = 0.5))

p4 <- p4 + scale_fill_brewer(palette = "Paired")
p4 <- p4 + scale_color_brewer(palette = "Paired")
p4 <- p4 + ylab("Genome_size (Mbp)")
p4 <- p4 + xlab(NULL)
p4 <- p4 + theme(legend.position="none")
p4 <- p4 + scale_y_continuous(labels=scaleFUN1)

p5 <- ggplot(data=df1, aes(x = Type,y=N50,fill=Type))
p5 <- p5 + geom_boxplot(outlier.alpha = 0.1,width=0.2)
p5 <- p5 + theme(plot.background=element_blank(),panel.background=element_blank())
p5 <- p5 + theme_bw()
p5 <- p5 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                 axis.text.y=element_text(colour="black",family="Times",size=10,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                 axis.title.y=element_text(family="Times",size = 12,face="plain"), #设置y轴标题的字体属性
                 axis.title.x=element_text(family="Times",size = 12,face="plain"), 
                 panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                 legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                          size=6),
                 legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                           size=6),
                 panel.grid.major = element_blank(),   #不显示网格线
                 panel.grid.minor = element_blank(),
                 panel.background = element_rect(colour = "black", size = 0.5))

p5 <- p5 + scale_fill_brewer(palette = "Paired")
p5 <- p5 + scale_color_brewer(palette = "Paired")
p5 <- p5 + ylab("N50 (Kbp)")
p5 <- p5 + xlab(NULL)
p5 <- p5 + theme(legend.position="none")
#p5 <- p5 + scale_y_continuous(labels=scaleFUN1)


All1 <- plot_grid(p2, p3, p4, p5, labels=c('a','b','c','d'),label_size = 12,ncol=4)
save_plot("COVID19_Fig.pdf", All1, base_width = 10,base_height =3)
