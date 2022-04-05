
################### Fig 2A-C Pie danout plots ##############
rm(list=ls())
library(ggplot2)
library(cowplot)
library(RColorBrewer)
library(webr)
library(dplyr)
setwd("/path to data/Basics")
df1 <- read.table("COVID_overview.txt",header=T)

p01 <- PieDonut(df1, aes(Label, Cohort, count=Sample), title = "COVID19 datasets",donutLabelSize = 3, r1=0.8)
p02 <- PieDonut(df1, aes(Label, Cohort, count=MAG), title = "MAG distribution",donutLabelSize = 3, r1=0.8)
p03 <- PieDonut(df1, aes(Label, Cohort, count=NR_MAG), title = "NR_MAG distribution",donutLabelSize = 3, r1=0.8)


gg1 <- ggMarginal(p1, type = "density", fill = "#2c7fb8", alpha = .2)

All1 <- plot_grid(gg1,labels=c('a'),label_size = 10,ncol=1)

save_plot("COVID19_dis.pdf", All1, base_width = 9,base_height =8)
