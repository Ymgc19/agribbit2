
# agribbit_for_win

<!-- badges: start -->
<!-- badges: end -->

The goal of agribbit_for_win is to handle census of agriculture and forestry in windous environment

## Installation

You can install the development version of agribbit like so:

``` r
# install.packages("devtools")
devtools::install_github("Ymgc19/agribbit_for_win")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(agribbit_for_win)
```

aquire the data of Akita pref. 2015 and inpute missing values
``` r
library(agribbit)
library(tidyverse)
library(kernlab)

# ========== 例として秋田県のデータ取得 ========== #
akita_2015 <- agribbit_for_win::agri.read_census_2015(5)
glimpse(akita_2015) # 確認

# ========== ガウス過程回帰による欠損値補完 ========== #
# ガウス過程回帰を動かすコード．warningが結構出るが一旦無視してください
hoge <- agribbit_for_win::agri.inpute_2015(akita_2015, "T000805011")

# 補完後のデータフレームを取得
akita_inputed <- hoge$inputed
glimpse(akita_inputed) # 確認

# 機械学習の予測結果の可視化
hoge$true.vs.predicted # データの散布が一点集中していると，geom_density_2d()関数が発動しないのでエラーになる．

# Enjoy!
```


