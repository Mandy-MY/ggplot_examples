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

#example 6
ggplot(
  data = gapminder,
  mapping = aes(
    x = year,
    y = lifeExp,
    group = country, # this tells R each country needs its own line
  )
) +
  geom_point() +
  geom_line(aes(colour = continent)) # if we tell R to colour by continient a the line (ie setting the asthetic against the data), the order is important as you can see the point is behind the line

# geometries 

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(alpha = 0.3) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 3) # adds a trend line

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(aes(colour = continent), alpha = 0.3) +
  scale_x_log10() +
  scale_colour_manual(values = c("black", "green", "orange", "pink", "blue"))

#Challenge 9 Modify the color and size of the points on the point layer 

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(colour = "pink", size = .25) + # sets all points to pink and small
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)


#Challenge 10 Modify your solution to Challenge 9 so that the points are now a different shape and are colored by continent with new trendlines

ggplot(data = gapminder, 
       aes(x = gdpPercap, 
           y = lifeExp,
           colour = continent)) +
  geom_point(shape = "diamond") + # this sets all points as diamonds
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.0) # this worked 'by accident so by using the continent in the mapping it creates a trendlind for each

#Challenge 10b
ggplot(data = gapminder, 
       aes(x = gdpPercap, 
           y = lifeExp,
           colour = continent)) +
  geom_point(shape = "diamond") + 
  scale_x_log10() + 
  scale_colour_manual(values = c("black", "green", "orange", "pink", "blue")) + # creates a vector of colours
  geom_smooth(method = "lm", size = 1.0) # this worked 'by accident so by using the continent in the mapping it creates a trendlind for each
  
#Challenge 10c
ggplot(data = gapminder, 
       aes(x = gdpPercap, 
           y = lifeExp,
           colour = continent,
           shape = continent)) + # both colour and shape will be different for each continent, but default 
  geom_point() +
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.0)

#Challenge 10 d
ggplot(data = gapminder, 
       aes(x = gdpPercap, 
           y = lifeExp,
           colour = continent,
           shape = continent)) + # both colour and shape will be different for each continent, but default 
  geom_point() +
  scale_x_log10() + 
  scale_colour_manual(values = c("black", "green", "orange", "pink", "blue")) + # creates a vector of colours
  scale_shape_manual(values = c(3,4,8,9,10))

# Challenge 11 - Try modifying the plot above by changing some colours in the scale or Select an appropriate colour palette for the continents from ColorBrewer 

ggplot(data = gapminder, 
       aes(x = gdpPercap, 
           y = lifeExp,
           colour = continent,
           shape = continent)) + # both colour and shape will be different for each continent, but default 
  geom_point() +
  scale_x_log10() + 
  scale_color_brewer(pallet = "OrRd") +
  scale_shape_manual(values = c(3,4,8,9,10))
  
# more - Separating figures

a_countries <-  gapminder %>% 
  filter(str_starts(country, "A")) # create a dataframe with contries starting with A

ggplot(
  data = a_countries,
  mapping = aes(
    x = year,
    y = lifeExp,
    colour = continent,
    group = country)) +
  geom_line() +
  facet_wrap(~country)

#Challenge 12 looking at gapminder data across time as individual plots

ggplot(
  data = gapminder, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~year)

#getting side-tracked - is there a way to identify outliers?
#using a label

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, 
                y = lifeExp, 
                colour = continent, 
                size = pop,
                label = country)
) +
  geom_point() +
  scale_x_log10() +
  geom_text() # labels everything so it's not all that helpful

gapminder_rich <- filter(gapminder_1977, gdpPercap > 30000) # create a subset of data

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, 
                y = lifeExp, 
                colour = continent, 
                size = pop,
                label = country)
) +
  geom_point() +
  scale_x_log10() +
  geom_text(data = gapminder_rich, size = 5) # now uses the subset of data for the labels


#saving ggplots for later use

example_plot <- ggplot(
  data = a_countries,
  mapping = aes(
    x = year,
    y = lifeExp,
    colour = continent,
    group = country)) +
  geom_line() +
  facet_wrap(~country)

#using saved plots

example_plot + scale_color_brewer(palette = "Dark2") #changing the colour palette

example_plot +
  scale_color_brewer(palette = "Dark2") + #changing the colour palette
  labs(title = "Life Expectency by Year",
       x = "Year",
       y = "Life Expectency (years)",
       caption = "Countries starting with A")

# using themes

example_plot +
  theme_bw() #applies the standard theme bw (black and white)

example_plot +
  scale_color_brewer(palette = "Dark2") + #changing the colour palette
  labs(title = "Life Expectency by Year",
       x = "Year",
       y = "Life Expectency (years)",
       caption = "Countries starting with A") +
  theme(
    plot.title = element_text(colour = "blue"))

ggsave("results/themes_plot.png") # default is to save the last plot you ran

ggsave("results/original_plot.png", 
       plot = example_plot,
       width = 20,
       height = 15,
       units = "cm",
       dpi = 200)
