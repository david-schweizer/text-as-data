#remotes::install_github("GuangchuangYu/hexSticker")

library(hexSticker)
library(magick)
library(sysfonts)
library(gapminder)
library(tidyverse)
library(hrbrthemes)
library(viridis)

data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

plot <- data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=log(gdpPercap), y=lifeExp, 
             #size=pop, 
             fill=continent)) +
  geom_point(alpha=0.5, shape=21, color="black") +
  #scale_size(range = c(.1, 24), name="Population (M)") +
  scale_fill_viridis(discrete=TRUE, guide=FALSE, option="D") +
  theme_void() +
  theme(legend.position="bottom") +
  ylab("") +
  xlab("") +
  theme(legend.position = "none") 
  
# 
# gapminder_cleaned <- gapminder %>% 
#   #filter(year == "2007") %>% 
#   filter(continent == "Africa" | continent == "Europe")
# 
# plot <- ggplot(data = gapminder_cleaned, aes(x = year, y = lifeExp)) +
#   geom_jitter(alpha = 0.1, aes(color = continent)) +
#   geom_smooth(aes(color = continent), alpha = 0.7) +
#   guides(size = FALSE, color = FALSE) +
#    labs(
#      x = "",
#      y = ""
#    ) +
#   theme_minimal() +
#   theme(panel.grid.major=element_line(colour="black"),
#         panel.grid.minor=element_blank())

#stripes <- image_read("images/climate_stripes.png")

fonts <- font_files()

font_add("Calibri", "calibriz.ttf")

sticker(subplot = plot,
  package = "Automated Data Collection",
  s_width = 1.6,
  s_height = 1,
  s_x = 0.93,
  s_y = 0.85,
  h_fill = "#8399b0",
  h_color = "black",
  h_size = 0.85,
  spotlight = F,
  l_y = 1,
  l_x = 1,
  l_width = 1,
  l_height = 1,
  l_alpha = 0.3,
  p_size = 10,
  p_color = "black",
  p_family = "Calibri",
  filename="images/hex_sticker.png") %>% 
  print()
