library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())



df <- read.csv("HairEyeColor.csv")

ggplot(df, aes(x = Hair, y = Freq))+
  geom_bar(
    aes(fill = Eye), stat = "identity", color = "white",
    position = position_dodge(0.9)
    )+
  facet_wrap(~Sex) + 
  fill_palette("jco")


housetasks <- read.delim("housetasks.txt",row.names = 1)
head(housetasks, 4)

ggballoonplot(housetasks, fill = "value")+
  scale_fill_viridis_c(option = "C")



df <- as.data.frame(HairEyeColor)
ggballoonplot(df, x = "Hair", y = "Eye", size = "Freq",
              fill = "Freq", facet.by = "Sex",
              ggtheme = theme_bw()) +
  scale_fill_viridis_c(option = "C")


library(vcd)
mosaic(HairEyeColor, shade = TRUE, legend = TRUE) 


library(FactoMineR)
library(factoextra)
res.ca <- CA(housetasks, graph = FALSE)
fviz_ca_biplot(res.ca, repel = TRUE)
