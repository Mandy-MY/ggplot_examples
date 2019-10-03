library(tidyverse) # load the tidyverse

gapminder <- read_csv("data/gapminder.csv") # create the gapminder variable from te csv file

gapminder_1977 <- filter(gapminder, year == 1977)
