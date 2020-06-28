
library(tidyverse)
library(readxl)

# ============= VISUALIZANDO DEMOCRACIA EN BOLIVIA ================

# importamos datasets de democracia, y traemos columnas de interés
bol.poliv <- read_xls("p5v2018.xls") %>% select(country, year, polity2) %>% 
  filter(country == "Bolivia")

bol.vdem <- read_rds("V-Dem-CY-Full+Others-v10.rds") %>% 
  select(country_name, year, v2x_polyarchy, v2x_egaldem) %>%
  filter(country_name == "Bolivia")


# grafiquemos la serie de tiempo de polity iv
ggplot(bol.poliv, aes(year, polity2)) +
  theme_classic() +
  geom_line(aes(alpha=1/5)) +
  geom_point(aes(group= 1, colour = ifelse(polity2>0, "red", "green") )) +
  scale_y_continuous(breaks = seq(-10,10, 2), limits = c(-10, 10) ) +
  scale_x_continuous(breaks = seq(1980, 2018, 2), limits = c(1980, 2018)) +
  geom_hline(yintercept = 0) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none") +
  labs(x="", y = "Ìndice de democracia Polity IV")



# grafiquemos la serie de tiempo de de v-dem
ggplot(bol.vdem, aes(year)) +
  theme_classic() +
  geom_line(aes(y= v2x_polyarchy, alpha=1/5)) +
  geom_point(aes(y= v2x_polyarchy, color = "blue", shape = "Democracia Electoral")) +
  geom_line(aes(y= v2x_egaldem, alpha=1/5)) +
  geom_point(aes(y= v2x_egaldem, shape = "Democracia Igualitaria")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "top") +
  scale_y_continuous(limits = c(0,1)) +
  scale_x_continuous(breaks = seq(1980, 2020, 2), limits = c(1980, 2020)) +
  guides(color = "none", alpha = "none") +
  labs(x= "", y="Nivel de democracia", shape = "", title = "Democracia en Bolivia", 
       subtitle = "Datos del V-Dem")















