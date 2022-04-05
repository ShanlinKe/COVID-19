rm(list=ls())
library(ggplot2)
library(RColorBrewer)
library(viridis)
library(cowplot)

setwd("path to data")
df1<-read.table("COVID_data1.txt",header=T)
df1<-read.table("COVID_data2.txt",header=T)


df1$ID <- factor(df1$ID, levels=unique(df1$ID))
df2$Phyla <- factor(df2$Phyla, levels=unique(df2$Phyla))
cbPalette1=c("#B2DF8A", "#33A02C","#FDBF6F", "#FF7F00", "#FB9A99", "#E31A1C",  "#1F78B4","#A6CEE3","#CAB2D6", "#6A3D9A", "#FFFF99", "#B15928", "#D95F02", "#9E1862", "#E6AB02", "#666666")


p1 <- ggplot(df1, aes(x=ID, y=Completeness,fill=Phyla))
p1 <- p1 + geom_bar(stat="identity", width=0.7,position = 'dodge',size=0.001)
p1 <- p1 + theme_bw()
p1 <- p1 + theme(panel.grid=element_blank(),axis.line=element_line(size=0.2,colour="black"),
                 axis.title.x=element_text(family="Times",size = 10,face="plain"),
                 axis.title.y=element_text(family="Times",size = 10,face="plain"))
p1 <- p1 + scale_fill_manual(values=cbPalette1)
p1 <- p1 + theme(axis.text.x = element_text(size = 8,face = "plain",colour="black"))
p1 <- p1 + theme(axis.text.y = element_text(size = 8,face = "plain",colour="black"))
p1 <- p1 + theme(axis.ticks.x=element_line(size=0.5)) 
p1 <- p1 + theme(axis.ticks.y=element_line(size=0.5)) 
p1 <- p1 + theme(axis.ticks.length=unit(.2,"lines"))
p1 <- p1 + ylab("Completeness")
p1 <- p1 + xlab(NULL)
p1 <- p1 + theme(legend.position="none")
p1 <- p1 + coord_flip()
#p1 <- p1 + scale_y_continuous(expand = c(0,0), limits = c(0, 0.12),breaks=seq(0,0.12,0.03))

p2 <- ggplot(df1, aes(x=ID, y=Contamination,fill=Phyla))
p2 <- p2 + geom_bar(stat="identity", width=0.7,position = 'dodge',size=0.001)
p2 <- p2 + theme_bw()
p2 <- p2 + theme(panel.grid=element_blank(),axis.line=element_line(size=0.2,colour="black"),
                 axis.title.x=element_text(family="Times",size = 10,face="plain"),
                 axis.title.y=element_text(family="Times",size = 10,face="plain"))
p2 <- p2 + scale_fill_manual(values=cbPalette1)
p2 <- p2 + theme(axis.text.x = element_text(size = 8,face = "plain",colour="black"))
p2 <- p2 + theme(axis.text.y = element_text(size = 8,face = "plain",colour="black"))
p2 <- p2 + theme(axis.ticks.x=element_line(size=0.5)) 
p2 <- p2 + theme(axis.ticks.x=element_line(size=0.5)) 
p2 <- p2 + theme(axis.ticks.length=unit(.2,"lines"))
p2 <- p2 + ylab("Contamination")
p2 <- p2 + xlab(NULL)
p2 <- p2 + theme(legend.position="none")
p2 <- p2 + coord_flip()

p3 <- ggplot(df2, aes(x="", y=Ratio, fill=Phyla))
p3 <- p3 + geom_bar(width = 1, stat = "identity")
p3 <- p3 + coord_polar("y", start=0)
p3 <- p3 + scale_fill_manual(values=cbPalette1)
p3 <- p3 + theme_bw()
p3 <- p3 + theme(panel.grid=element_blank(),axis.line=element_line(size=0.2,colour="black"),
                 axis.title.x=element_text(family="Times",size = 10,face="plain"),
                 axis.title.y=element_text(family="Times",size = 10,face="plain"))
p3 <- p3 + theme(panel.grid=element_blank(),axis.line=element_line(size=0.2,colour="black"),
                 axis.title.x=element_text(family="Times",size = 8,face="plain"),
                 axis.title.y=element_text(family="Times",size = 8,face="plain"))
p3 <- p3 + theme(axis.text.x = element_text(size = 6,face = "plain",colour="black"))
p3 <- p3 + theme(axis.text.y = element_text(size = 6,face = "plain",colour="black"))
p3 <- p3 + theme(axis.ticks.x=element_line(size=0.5)) 
p3 <- p3 + theme(axis.ticks.x=element_line(size=0.5)) 
p3 <- p3 + theme(axis.ticks.length=unit(.2,"lines"))
p3 <- p3 + theme(legend.position = "none")


plot <- plot_grid(p3, p1,p2,labels=c('a','b','c'),label_size = 10,ncol=3, rel_widths = c(1.8, 1,1))

save_plot("COVID19_Fig.pdf", plot, base_width = 9,base_height =4)
