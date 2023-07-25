library(ggplot2)
library(RColorBrewer)
library(viridis)

# Read the file
ds <- 
read.csv("/Users/shriyasaishivakumar/MR.SmkInit.Blood/DrnksWk.EUR.csv")

# Extract the trait name
ds$id.exposure <- sub("^[^.]+\\.(.*?)\\..*$", "\\1", ds$id.exposure)

# Setting as factors
ds$Exposure <- factor(ds$id.exposure, levels = unique(ds$id.exposure))

# Plot
bp <- ggplot(ds, aes(x = b, y = Exposure, color = Exposure)) + 
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = TRUE) +
  geom_errorbarh(aes(xmin = b - se, xmax = b + se), height = 0.3) +
  labs(title = "DrnksWk EUR -> EUR",y = NULL, x = "Effect (SD units)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
#, panel.grid = element_blank()) + 
  scale_y_discrete(limits = rev(levels(ds$Exposure))) +
  xlim(-0.4, 0.4) +  
  geom_text(aes(label = ifelse(pval < 0.05, "*", "")),vjust = -0.5, color 
= "black") +
 geom_vline(xintercept = 0, linetype = "solid", color = "grey")  


# Color code y-axis labels
my_colors <- viridis_pal(option = "viridis")(16)
bp <- bp + scale_color_manual(values = my_colors)

# Save the plot
ggsave("scatterplot_with_asterisk_and_hline.pdf", plot = bp)


