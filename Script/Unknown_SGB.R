rm(list=ls())
library(ggplot2)
library(RColorBrewer)
library(viridis)
library(cowplot)

setwd("/path to data")
df1 <- data.frame(Type = c("Known_SGB", "Unknown_SGB"),size= c(712,160),Ratio = c(81.65, 18.35))
cbPalette1=c("#A6CEE3", "#1F78B4")

p1 <- ggplot(df1, aes(x = 2, y = Ratio, fill = Type))
p1 <- p1 + geom_bar(stat = "identity", color = "white") 
p1 <- p1 + coord_polar(theta = "y", start = 0)
p1 <- p1 + geom_text(aes(label = Ratio), color = "white",size=3,position = position_stack(vjust = 0.5))
p1 <- p1 + scale_fill_manual(values=cbPalette1)
p1 <- p1 + theme(panel.grid=element_blank(),axis.line=element_line(size=0.2,colour="black"),
                 axis.title.x=element_text(family="Times",size = 8,face="plain"),
                 axis.title.y=element_text(family="Times",size = 8,face="plain"))
p1 <- p1 + theme(axis.text.x = element_text(size = 6,face = "plain",colour="black"))
p1 <- p1 + theme(axis.text.y = element_text(size = 6,face = "plain",colour="black"))
p1 <- p1 + theme(axis.ticks.x=element_line(size=0.5)) 
p1 <- p1 + theme(axis.ticks.x=element_line(size=0.5)) 
p1 <- p1 + theme(axis.ticks.length=unit(.2,"lines"))
p1 <- p1 + theme_void()
p1 <- p1 + xlim(0.5, 2.5)
#p1 <- p1 + theme(legend.position="none")


plot <- plot_grid(p1, labels=c(''),label_size = 10,ncol=1)

save_plot("COVID19_Fig.pdf", plot, base_width = 4,base_height =3)
