library(ggplot2)
library(ggrepel)
library(wesanderson)

### BOX PLOT ECOSYSTEM
ggplot(PLOT.wetlands, aes(x= Ecosystem2, y=StorageC_t.ha)) +
  geom_boxplot() +
  labs(x = "", y= "Carbon storage tonn/ha") +
  theme_bw() +
  theme(axis.title.x = element_text(size=14,hjust=0.5),
        axis.title.y = element_text(size=14,vjust=1),
        axis.text.x = element_text(size=12,color='black'),
        axis.text.y = element_text(size=12,color='black'),
        legend.title = element_text(color="black", size=14),
        legend.text = element_text(color="black", size=12)) +
  theme(panel.grid.minor.x=element_blank(),                          #Hide all the vertical gridlines
        panel.grid.major.x=element_blank(),
        #panel.grid.minor.y=element_blank(),                           #Hide all the horizontal gridlines
        panel.grid.major.y=element_blank()) 

#save as 575x650

### BOX PLOT
ggplot(PLOT.wetlands_RLNT, aes(x= RLNT, y=StorageC_t.ha)) +
  geom_boxplot() +
  labs(x = "", y= "Carbon storage tonn/ha") +
  theme_bw() +
  theme(axis.title.x = element_text(size=14,hjust=0.5),
        axis.title.y = element_text(size=14,vjust=1),
        axis.text.x = element_text(size=12,color='black'),
        axis.text.y = element_text(size=12,color='black'),
        legend.title = element_text(color="black", size=14),
        legend.text = element_text(color="black", size=12)) +
  theme(panel.grid.minor.x=element_blank(),                          #Hide all the vertical gridlines
        panel.grid.major.x=element_blank(),
        #panel.grid.minor.y=element_blank(),                           #Hide all the horizontal gridlines
        panel.grid.major.y=element_blank()) 

#col= "810f7c" og "8856a7"

myfill <- c("#a6dba0", "#7b3294", "#c2a5cf", "#008837", "#f7f7f7")
mycolors <- c("black", "black", "black", "black", "black")
myshapes <- c(21, 22, 24)

### NMDS SITE AND SPECIES PLOT
ggplot(data=all.point.scores, aes(x=NMDS1, y=NMDS2)) + 
  geom_point(data=all.point.scores, aes(x=NMDS1, y=NMDS2, fill = linje, color = linje, shape= AAR2),  size = 4) + # 
  labs(x = "NMDS1 scores", y= "NMDS2 scores", fill = "Transect", color = "Transect", shape = "Year") + #,
  scale_color_manual(values=mycolors) +
  #scale_fill_manual(values=myfill) +
  scale_fill_manual(values=wes_palette(name="Darjeeling2", n=5)) +
  scale_shape_manual(values = c(21,22,24)) +
  theme_bw() +
  theme(axis.title.x = element_text(size=14,hjust=0.5),
        axis.title.y = element_text(size=14,vjust=1),
        axis.text.x = element_text(size=12,color='black'),
        axis.text.y = element_text(size=12,color='black'),
        legend.title = element_text(color="black", size=14),
        legend.text = element_text(color="black", size=12)) +
  theme(panel.grid.minor.x=element_blank(),                          #Hide all the vertical gridlines
        panel.grid.major.x=element_blank(),
        panel.grid.minor.y=element_blank(),                           #Hide all the horizontal gridlines
        panel.grid.major.y=element_blank()) +
  geom_text_repel(aes(label=Artslinje_id), size=2.5, alpha=0.5, max.overlaps = getOption("ggrepel.max.overlaps", default = 5)) +  #add smaller text
  geom_text_repel(data= species.scores, aes(x=NMDS1,y=NMDS2,label=species), size=3.5, alpha=0.5, max.overlaps = getOption("ggrepel.max.overlaps", default = 15))

##geom_polygon(data=all.point.scores, aes(x = NMDS1, y = NMDS2, fill= linje, group=linje), alpha = 0.30) +

#save as 650x600 // 800x700