rm(list=ls())
library(ggplot2)
library(cowplot)
library(reshape2)
library(ggpubr)
setwd("/path to data")

dat<-read.table("COVID19_data.txt",header=T)

dat1<-dat[which(dat$Access=="Data1"),]
dat2<-dat[which(dat$Access=="Data2"),]
dat3<-dat[which(dat$Access=="Data3"),]
dat4<-dat[which(dat$Access=="Data4"),]
dat5<-dat[which(dat$Access=="Data5"),]
dat6<-dat[which(dat$Access=="Data6"),]

my_comparisons1 <- list(c("COVID-19", "Non-COVID-19"))
my_comparisons2 <- list(c("COVID-19", "Pneumonia"))
my_comparisons3 <- list(c("Non-COVID-19", "Pneumonia"))


scaleFUN1 <- function(x) sprintf("%.1f", x)
scaleFUN2 <- function(x) sprintf("%.2f", x)

p01 <- ggplot(data=dat1, aes(x = Group,y=Richness,fill=Group))
p01 <- p01 + geom_boxplot(outlier.alpha = 0.1,width=0.28,outlier.size=0.2)
p01 <- p01 + theme(plot.background=element_blank(),panel.background=element_blank())
p01 <- p01 + theme_bw()
p01 <- p01 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
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

p01 <- p01 + scale_fill_brewer(palette = "Paired")
p01 <- p01 + scale_color_brewer(palette = "Paired")
p01 <- p01 + ylab("Richness")
p01 <- p01 + xlab(NULL)
p01 <- p01 + theme(legend.position="none")
#p01 <- p01 + scale_y_continuous(labels=scaleFUN1)
p01 <- p01  + stat_compare_means(comparisons = my_comparisons1,label = "p.format",size=2.5,method = "wilcox.test",label.x = 1.2, label.y = 1600)
p01 <- p01  + stat_compare_means(comparisons = my_comparisons2,label = "p.format",size=2.5,method = "wilcox.test",label.x = 1.2, label.y = 2000)
p01 <- p01  + stat_compare_means(comparisons = my_comparisons3,label = "p.format",size=2.5,method = "wilcox.test",label.x = 1.2, label.y = 1800)

#
p02 <- ggplot(data=dat2, aes(x = Group,y=Richness,fill=Group))
p02 <- p02 + geom_boxplot(outlier.alpha = 0.1,width=0.2,outlier.size=0.2)
p02 <- p02 + theme(plot.background=element_blank(),panel.background=element_blank())
p02 <- p02 + theme_bw()
p02 <- p02 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
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

p02 <- p02 + scale_fill_brewer(palette = "Paired")
p02 <- p02 + scale_color_brewer(palette = "Paired")
p02 <- p02 + ylab("Richness")
p02 <- p02 + xlab(NULL)
p02 <- p02 + theme(legend.position="none")
#p03 <- p03 + scale_y_continuous(expand = c(0,0), limits = c(0.55, 1),breaks=seq(0.55,1,0.1),labels=scaleFUN2)
p02 <- p02  + stat_compare_means(comparisons = my_comparisons1,label = "p.format",size=2.5,method = "wilcox.test", label.x = 1.2, label.y = 445)

p03 <- ggplot(data=dat3, aes(x = Group,y=Richness,fill=Group))
p03 <- p03 + geom_boxplot(outlier.alpha = 0.1,width=0.11,outlier.size=0.2)
p03 <- p03 + theme(plot.background=element_blank(),panel.background=element_blank())
p03 <- p03 + theme_bw()
p03 <- p03 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                   axis.text.y=element_text(colour="black",family="Times",size=10,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                   axis.title.y=element_text(family="Times",size = 12,face="plain"), #设置y轴标题的字体属性
                   axis.title.x=element_text(family="Times",size = 14.5,face="plain"), 
                   panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                   legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                            size=6),
                   legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                             size=6),
                   panel.grid.major = element_blank(),   #不显示网格线
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(colour = "black", size = 0.5))

p03 <- p03 + scale_fill_brewer(palette = "Paired")
p03 <- p03 + scale_color_brewer(palette = "Paired")
p03 <- p03 + ylab("Richness")
p03 <- p03 + xlab("Non−COVID−19")
p03 <- p03 + theme(legend.position="none")

p04 <- ggplot(data=dat4, aes(x = Group,y=Richness,fill=Group))
p04 <- p04 + geom_boxplot(outlier.alpha = 0.1,width=0.2,outlier.size=0.2)
p04 <- p04 + theme(plot.background=element_blank(),panel.background=element_blank())
p04 <- p04 + theme_bw()
p04 <- p04 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
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

p04 <- p04 + scale_fill_brewer(palette = "Paired")
p04 <- p04 + scale_color_brewer(palette = "Paired")
p04 <- p04 + ylab("Richness")
p04 <- p04 + xlab(NULL)
p04 <- p04 + theme(legend.position="none")
#p07 <- p07 + scale_y_continuous(expand = c(0,0), limits = c(0.55, 1),breaks=seq(0.55,1,0.1),labels=scaleFUN2)
p04 <- p04  + stat_compare_means(comparisons = my_comparisons1,label = "p.format",size=2.5,method = "wilcox.test", label.x = 1.2, label.y = 32)

p05 <- ggplot(data=dat5, aes(x = Group,y=Richness,fill=Group))
p05 <- p05 + geom_boxplot(outlier.alpha = 0.1,width=0.11,outlier.size=0.2)
p05 <- p05 + theme(plot.background=element_blank(),panel.background=element_blank())
p05 <- p05 + theme_bw()
p05 <- p05 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
                   axis.text.y=element_text(colour="black",family="Times",size=10,face="plain"), #设置y轴刻度标签的字体簇，字体大小，字体样式为plain
                   axis.title.y=element_text(family="Times",size = 12,face="plain"), #设置y轴标题的字体属性
                   axis.title.x=element_text(family="Times",size = 14.5,face="plain"), 
                   panel.border = element_blank(),axis.line = element_line(colour = "black",size=0.3), #去除默认填充的灰色，并将x=0轴和y=0轴加粗显示(size=1)
                   legend.text=element_text(face="italic", family="Times", colour="black",  #设置图例的子标题的字体属性
                                            size=6),
                   legend.title=element_text(face="italic", family="Times", colour="black", #设置图例的总标题的字体属性
                                             size=6),
                   panel.grid.major = element_blank(),   #不显示网格线
                   panel.grid.minor = element_blank(),
                   panel.background = element_rect(colour = "black", size = 0.5))

p05 <- p05 + scale_fill_brewer(palette = "Paired")
p05 <- p05 + scale_color_brewer(palette = "Paired")
p05 <- p05 + ylab("Richness")
p05 <- p05 + xlab("Non−COVID−19")
p05 <- p05 + theme(legend.position="none")

p06 <- ggplot(data=dat6, aes(x = Group,y=Richness,fill=Group))
p06 <- p06 + geom_boxplot(outlier.alpha = 0.1,width=0.2,outlier.size=0.2)
p06 <- p06 + theme(plot.background=element_blank(),panel.background=element_blank())
p06 <- p06 + theme_bw()
p06 <- p06 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
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

p06 <- p06 + scale_fill_brewer(palette = "Paired")
p06 <- p06 + scale_color_brewer(palette = "Paired")
p06 <- p06 + ylab("Richness")
p06 <- p06 + xlab(NULL)
p06 <- p06 + theme(legend.position="none")
#p11 <- p11 + scale_y_continuous(expand = c(0,0), limits = c(0.55, 1),breaks=seq(0.55,1,0.1),labels=scaleFUN2)
p06 <- p06  + stat_compare_means(comparisons = my_comparisons1,label = "p.format",size=2.5,method = "wilcox.test", label.x = 1.2, label.y = 2600)

plot1 <- plot_grid(p01, p03, p05, p06, p02, p04, labels=c('a','b','c', 'd','e','f'),label_size = 10,ncol=6)

save_plot("COVID19_Fig.pdf", plot1, base_width = 10,base_height =3)
