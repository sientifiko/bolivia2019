
library(tidyverse)
library(readxl)

# ============= VISUALIZANDO DEMOCRACIA EN BOLIVIA ================

# importamos el polity IV, y traemos columnas de interés
bol.poliv <- read_xls("p5v2018.xls") %>% select(country, year, polity2) %>% 
  filter(country == "Bolivia")

# grafiquemos la serie de tiempo
ggplot(bol.poliv, aes(year, polity2)) +
  theme_classic() +
  geom_line(aes(alpha=1/5)) +
  geom_point(aes(group= 1, colour = ifelse(polity2>0, "red", "green") )) +
  scale_y_continuous(breaks = seq(-10,10, 2), limits = c(-10, 10) ) +
  scale_x_continuous(breaks = seq(1980, 2018, 2), limits = c(1980, 2018)) +
  geom_hline(yintercept = 0) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none") +
  labs(x="", y = "Ìndice de democracia Polity IV")


# 

















