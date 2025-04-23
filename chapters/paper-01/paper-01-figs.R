#############################################################################
## paper-01_figs: Script to prepare all plots used in chapter 
##
## Date: 28-5-2025
## Author: Ben Black
#############################################################################

# Use built-in mtcars dataset
data(mtcars)

# Create a ggplot
p <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(
    title = "Fuel Efficiency vs. Car Weight",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon",
    color = "Cylinders"
  ) +
  scale_colour_thesis(palette = "test_pal")+
  theme_thesis()

#save plot
ggsave(plot = p,
       filename = "chapters/paper-01/figures/dummy_plot.png",
       device='png',
       dpi=300,
       width = 21,
       height = 21,
       units = "cm")


