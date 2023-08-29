library(tidyverse)
library(ggplot2)
library(ggtext)



setwd('D:/MIND_semjudg/misc')

df = read.csv('Late Alpha Window Peaks_TPJ.csv') #Load Dataset

data = df %>%
           pivot_longer(cols = Early: Late, names_to = "Time", values_to = "pseudo_t") #Change dataset into long format
data$time = factor(data$Time, levels = c("Early", "Middle", "Late")) #Set window variables

#Create Violin Plot with Boxplot inside
data %>% 
  ggplot(mapping = aes(x = Time, y = pseudo_t, fill = Condition)) +
  scale_fill_manual(values=c("#408FAA", "#E49435"))+
  geom_violin(trim=F,show.legend = F) +
  geom_boxplot(aes(col = Condition), width=0.2, fill = 'gray86', position = position_dodge(0.9))+
  scale_color_manual(values=c('black','black'))+
  xlab('Time-Frequency Window') +
  ylab('Pseudo-t')+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(size = 20, color = 'gray28'),
        axis.title = element_text(size = 20, color = 'gray28'),
        axis.title.x  = element_text(family = "sans"),
        legend.position = "none")+
  coord_cartesian(ylim = c(-110, 50)) + 
  scale_x_discrete(limits=c("Early","Middle","Late"))