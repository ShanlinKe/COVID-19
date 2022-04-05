rm(list=ls())
library(ggplot2)
library(cowplot)
library(RColorBrewer)
setwd("/path/data")
df1 <- read.table("COVID_data.txt",header=T)

p1 <- ggplot(df1, aes(x=Label, y=Ratio_bins, fill=Label))
p1 <- p1 + geom_bar(stat="identity")
p1 <- p1 + scale_fill_brewer(palette="Paired")
p1 <- p1 + theme(plot.background=element_blank(),panel.background=element_blank())
p1 <- p1 + theme_bw()
p1 <- p1 + theme(axis.text.x=element_text(angle=45,hjust = 1,colour="black",family="Times",size=8), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                   axis.text.y=element_text(colour="black",family="Times",size=8,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                   axis.title.x=element_text(family="Times",size = 10,face="plain"), #设置y轴标题的字体属性
                   axis.title.y=element_text(family="Times",size = 10,face="plain"), #设置y轴标题的字体属性
                   panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                   legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                            size=6),
                   legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                             size=6),
                   panel.grid.major = element_blank(),   #不显示网格线
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(colour = "black", size = 0.5))
p1 <- p1 + theme(legend.position = "none")


p2 <- ggplot(df1, aes(x=Label, y=Ratio_mags, fill=Label))
p2 <- p2 + geom_bar(stat="identity")
p2 <- p2 + scale_fill_brewer(palette="Paired")
p2 <- p2 + theme(plot.background=element_blank(),panel.background=element_blank())
p2 <- p2 + theme_bw()
p2 <- p2 + theme(axis.text.x=element_text(angle=45,hjust = 1,colour="black",family="Times",size=8), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                   axis.text.y=element_text(colour="black",family="Times",size=8,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                   axis.title.x=element_text(family="Times",size = 10,face="plain"), #设置y轴标题的字体属性
                   axis.title.y=element_text(family="Times",size = 10,face="plain"), #设置y轴标题的字体属性
                   panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                   legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                            size=6),
                   legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                             size=6),
                   panel.grid.major = element_blank(),   #不显示网格线
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(colour = "black", size = 0.5))
p2 <- p2 + theme(legend.position = "none")

plot1<-plot_grid(p1, p2, labels=c('a','b'), ncol=2)

save_plot("COVID19_Fig.pdf", plot1, base_width = 6,base_height = 3)
