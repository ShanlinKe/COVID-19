
##########  Fraction of common MAG ##########################
setwd("/path to data")

data1<-read.table("COVID19_data.txt",header=T,row.names=1)
data2<-split(data1, data1$Name)

temp1<-NULL
temp2<-NULL

for (i in 1:length(data2)) {
  df1 <- data2[[i]]
  df1<-df1[,-c(1,3,4,5)]
  df1 <- df1[order(df1$qPCR),]
  df1<-t(df1)
  df1<-df1[-1,]
  for (j in 1:ncol(df1)) {
    dfa<-as.numeric(df1[,1])
    dfb<-as.numeric(df1[,j])
    mema=which(dfa>0)
    memb=which(dfb>0)
    shared=intersect(mema, memb)
    rate1<-(length(mema)-length(shared))/(length(mema))
    rate2<-(length(shared))/(length(mema)+length(memb))
    temp1<-rbind(temp1,rate1)
    temp2<-rbind(temp2,rate2)
  }
}
Final_rate<-cbind(data1[,c(1:5)],cbind(temp1, temp2))
names(Final_rate) <- c("Severity","PCR","Id","Name","Label","Rate1","Rate2")

Final_rate<-Final_rate[which(Final_rate$Rate1!="0"),]

Final_rate$Severity <- factor(Final_rate$Severity, levels = unique(c("mild","moderate","severe","critical")))
my_comparisons17 <- list(c("moderate", "severe"))
my_comparisons18 <- list(c("moderate", "critical"))
my_comparisons19 <- list(c("severe", "critical"))

p12 <- ggplot(data=Final_rate, aes(x = Severity,y=Rate2,fill=Severity))
p12 <- p12 + geom_boxplot(outlier.alpha = 0.1,width=0.26,outlier.size=0.2,fatten=1)
p12 <- p12 + theme(plot.background=element_blank(),panel.background=element_blank())
p12 <- p12 + theme_bw()
p12 <- p12 + theme(axis.text.x=element_text(angle = 45, hjust = 1,colour="black",family="Times",size=10), #设置x轴刻度标签的字体显示倾斜角度为15度，并向下调整1(hjust = 1)，字体簇为Times大小为20
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

p12 <- p12 + scale_fill_brewer(palette = "Paired")
p12 <- p12 + scale_color_brewer(palette = "Paired")
p12 <- p12 + ylab("Fraction of common nrMAGs")
p12 <- p12 + xlab(NULL)
p12 <- p12 + scale_y_continuous(labels = scaleFUN1)
p12 <- p12 + theme(legend.position="none")
p12 <- p12  + stat_compare_means(comparisons = my_comparisons11,label = "p.format",size=2.5,method = "wilcox.test",label.x = 1.2, label.y = 0.44)
p12 <- p12  + stat_compare_means(comparisons = my_comparisons12,label = "p.format",size=2.5,method = "wilcox.test",label.x = 1.2, label.y = 0.5)
p12 <- p12  + stat_compare_means(comparisons = my_comparisons13,label = "p.format",size=2.5,method = "wilcox.test",label.x = 1.2, label.y = 0.56)

plot1 <- plot_grid(plot12,ncol=1)
save_plot("COVID19_figure.pdf", plot1, base_width = 14,base_height =10)
