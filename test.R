# install.packages("devtools")
devtools::install_github("Ymgc19/agribbitforwin")

akita <- agribbitforwin::agri.read_census_2015(5)
akita %>% glimpse()

akita_shp <- agri.read_census_shp(5)

akita <- akita %>%
  agribbit::agri.inpute_2015("T000805011")

akita_c_s <- left_join(akita_shp, akita$inputed)

akita_c_s %>%
  ggplot() +
  geom_sf(
    aes(fill = inputed_T000805011),
    color = NA
  ) +
  scale_fill_gradient(low = "royalblue", high = "tomato") +
  theme_minimal()
