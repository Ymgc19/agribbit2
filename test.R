# install.packages("devtools")
devtools::install_github("Ymgc19/agribbit2")
library(agribbit2)

# 宮城県の2015年データを取得する
miyagi <- agribbit2::agri.read_census_2015(4)
miyagi %>% glimpse()

miyagi_shp <- agribbit2::agri.read_census_shp(4)

# 「販売価格が200-300万円」の欠損地を補完
hoge <- miyagi %>%
  agribbit::agri.inpute_2015("T000789006")

# 学習精度の可視化
hoge$true.vs.predicted
# 補完したデータのsummary
hoge$predicted_summary
# 学習結果のハイパラとか誤差
hoge$fit
# 補完した後のデータフレーム
miyagi_inputed <- hoge$inputed

# 地図データと補完したデータの接合
miyagi_inputed_shp <- left_join(miyagi_shp, miyagi_inputed)

# 簡単に可視化
miyagi_inputed_shp %>% agri.fast_draw(miyagi_inputed_shp$inputed_T000789006,
                                      fill_low = "royalblue", fill_high = "tomato")

# Enjoy!
