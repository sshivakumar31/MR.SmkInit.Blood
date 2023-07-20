library(ggplot2)

ds <- 
read.csv("/Users/shriyasaishivakumar/MR.SmkInit.Blood/DrnksWk.EUR.csv")
ds$id.exposure <- sub("^[^.]+\\.(.*?)\\..*$", "\\1", ds$id.exposure)

bp <- ggplot(ds, aes(x = b, y = id.exposure)) +
  geom_point(color="blue") +
  geom_smooth(methods = "lm", se = TRUE) +
  geom_errorbarh(aes(xmin = b - se, xmax = b + se), height = 0) +
  labs(title = "DrnksWk EUR -> EUR", y = "Exposure", x = "Effect Size")+
  theme_minimal()

# Color code y-axis labels
bp <- bp + theme(axis.text.y = element_text(color = c("red", "blue", 
"green", "orange")))

# Add Standard Error text
bp <- bp + geom_text(data = ds, aes(label = paste("SE =", se)), hjust = 
-0.2, color = "black")

ggsave("scatterplotdraft.pdf")

