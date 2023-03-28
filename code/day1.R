library(tidyverse)


gapminder_1997 <- read_csv("gapminder_1997.csv")
str(gapminder_1997)

?read_csv

sum(5,6)
round(3.1415)
round(3.1415, 3)
round(2, 3.1415)

#when we type round, the first number is what is considered to round off

round(x = 3.1415, digits = 2)

install.packages("readxl")
library(readxl)

ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life expectancy") +
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) + scale_color_brewer(palette = "Set1") + 
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)") 

ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) + 
  geom_point() + 
  scale_color_brewer(palette = "Set1") + 
  labs(x = "GDP Per capita", y= "Life expectancy", title = "Do people in wealthy countries live longer?", size = "population (in millions)")

#Load in a larger dataset

gapminder_data <- read_csv("gapminder_data.csv")
dim(gapminder_data)
ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, group = country, color = continent) + 
  geom_line()

# discrete plots
ggplot(data = gapminder_data) +
  aes(x = continent, y = lifeExp) + geom_boxplot()

ggplot(data = gapminder_data) +
  aes(x = continent, y = lifeExp) + geom_violin() + geom_point()

ggplot(data = gapminder_data) +
  aes(x = continent, y = lifeExp) + geom_violin() + geom_jitter()

ggplot(data = gapminder_data) +
  aes(x = continent, y = lifeExp) + geom_jitter() + geom_violin()


#Master aesthertics
ggplot(data = gapminder_data, aes(x = continent, y = lifeExp)) + geom_jitter() + geom_violin()

ggplot(data = gapminder_data, aes(x = continent, y = lifeExp)) + geom_violin() + geom_jitter(aes(size = pop)) 

ggplot(data = gapminder_data, aes(x = continent, y = lifeExp)) + geom_violin() + geom_jitter(aes(size = pop), color = "pink") 

ggplot(data = gapminder_data, aes(x = continent, y = lifeExp)) + geom_violin(fill = "pink") + geom_jitter(aes(size = pop))

ggplot(data = gapminder_data, aes(x = continent, y = lifeExp)) + geom_violin(aes(fill = continent))

ggplot(data = gapminder_data, aes(x = continent, y = lifeExp)) + geom_violin(fill = "springgreen")


#Univariate plots

ggplot(gapminder_1997) +
  aes(x = lifeExp) + geom_histogram(bins = 20, binwidth = 10)

#Plot themes
ggplot(gapminder_1997) + aes(x = lifeExp) + geom_histogram(bins = 20) +
  theme_classic() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
#the above command changes the text in x axis

#facet wrap
ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() + facet_wrap(vars(continent))

#facet grid
ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() + facet_grid(rows = vars(continent))

ggsave("awesome_plot.jpg", width = 6, height = 4)
#the above command saves the last plot made

awesome_plot <- ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() + facet_grid(rows = vars(continent))
ggsave(awesome_plot, file = "awesome_plot.jpg", width = 6, height = 4)

#Exercise
#-violin plot of continent and life expectacy
#-color mapped to continent
#-Assigned to an object "violin plot"
#-black and while theme
#-save it as "awesome_violin_plot.jpg"

ggplot(data = gapminder_1997) + aes(x = continent, y = lifeExp, color = continent) + geom_violin(aes(fill = continent)) + theme_bw()
ggsave("awesome_violin_plot.jpg", width = 6, height = 4)
