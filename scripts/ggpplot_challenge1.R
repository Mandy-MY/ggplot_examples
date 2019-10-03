library(tidyverse) # load the tidyverse

gapminder <- read_csv("data/gapminder.csv") # create the gapminder variable from te csv file

gapminder_1977 <- filter(gapminder, year == 1977) #create a new variable for 1977 only

ggplot(data = gapminder_1977) # first argument loads the data, the first step in grammar of graphics

ggplot(
  data = gapminder_1977,
  mapping = aes(x = gdpPercap,
                y = lifeExp,
                colour = continent,
                size = pop)) # loads the asthetics information for the x and y axis and colour and size 

ggplot(
  data = gapminder_1977,
  mapping = aes(x = gdpPercap,
                y = lifeExp,
                colour = continent,
                size = pop)) +
  geom_point() # now we add a new layer (outside of the aesthetics), tells it to plot to point

ggplot(
  data = gapminder_1977,
  mapping = aes(x = gdpPercap,
                y = lifeExp,
                colour = continent,
                size = pop)) +
  geom_point()+
  scale_x_log10() # somewhere there is an error in this code so need to trouble shoot, actually there was no error but R was only running partial script, needed to highlight all the script for it to run as one

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
) +
  geom_point() +
  scale_x_log10() # this one works

# Challenge - look at how variables change outputs if assigning to different asthetics
ggplot(
  data = gapminder_1977, 
  mapping = aes(x = continent, 
                y = country, 
                colour = lifeExp, 
                size = gdpPercap)
) +
  geom_point() # example 1 awful!! too mny countries on the y axix

ggplot(
  data = gapminder_1977, 
  mapping = aes(
    x = continent, 
    y = lifeExp, 
    colour = gdpPercap, 
    size = pop)
) +
  geom_point() # example 2

# Challenge: review geom help

?geom_point

# Challenge ; set some asethetics

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, 
                y = lifeExp, 
                colour = continent, 
                size = pop)
) +
  geom_point(shape = 24) +
  scale_x_log10() # example 3

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, 
                y = lifeExp, 
                colour = continent, 
                size = pop)
) +
  geom_point(shape = 24, stroke = 5) +
  scale_x_log10() # example 4

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, 
                y = lifeExp, 
                colour = continent, 
                size = pop)
) +
  geom_point(alpha = 0.1, colour = 1) +
  scale_x_log10() # example 5

# Challenge : plot all life expectency by year from gapminder variable

ggplot(
  data = gapminder,
  mapping = aes(
    x = year,
    y = lifeExp,
    colour = continent,
    size = pop
  )
) +
  geom_point() #scatter plot example

ggplot(
  data = gapminder,
  mapping = aes(
    x = year,
    y = lifeExp,
    group = country, # this tells R each country needs its own line
    colour = continent #this tells R the continents are identified by colour
  )
) +
  geom_line() #line example

ggplot(
  data = gapminder,
  mapping = aes(
    x = year,
    y = lifeExp,
    group = country, # this tells R each country needs its own line
    colour = continent #this tells R the continents are identified by colour
  )
) +
  geom_line() +
  geom_point() #line and point example

ggplot(
  data = gapminder,
  mapping = aes(
    x = year,
    y = lifeExp,
    group = country, # this tells R each country needs its own line
    colour = continent #this tells R the continents are identified by colour
  )
) +
  geom_point() +
  geom_line() #point then line example