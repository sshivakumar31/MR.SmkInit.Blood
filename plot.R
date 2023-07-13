library(ggplot2)

# Assuming you have already read the CSV file into a data frame called 'ds'
ds <- read.csv("/Users/shriyasaishivakumar/MR.SmkInit.Blood/DrnksWk.EUR.csv")
ds$id.exposure <- sub("^[^.]+\\.(.*?)\\..*$", "\\1", ds$id.exposure)

# Calculate means and standard errors by id.exposure
summary_data <- aggregate(b ~ id.exposure, ds, function(x) c(mean = mean(x), se = 
sd(x)/sqrt(length(x))))

# Create the box plot using ggplot and geom_boxplot
bp <- ggplot(ds, aes(x = b, y = id.exposure)) +
  geom_boxplot() +
  labs(title = "DrnksWk EUR -> EUR", y = "Exposure", x = "Effect Size")

# Add error bars
bp <- bp + geom_errorbar(data = summary_data, aes(x = mean, y = id.exposure, xmin 
= mean - se, xmax = mean + se), width = 0.2)

# Add P-value text
bp <- bp + geom_text(data = summary_data, aes(x = 0, y = id.exposure, label = 
paste("P =", P)), vjust = -0.5, color = "red")

# Save the plot as PDF
ggsave("boxplot2.pdf", plot = bp)

