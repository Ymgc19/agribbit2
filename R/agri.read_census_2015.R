# 農林業センサスのデータを読み込んでそのままオブジェクト化
#' @title read census data as object
#' @description \code{agri.read_census_2025}
#' @export

agri.read_census_2015 <- function(pref_code){
  pref_number <- pref_code
  agribbit2::agri.collect_census_2015(pref_code)
  if (pref_code <= 9){
    pref_code <- as.character(paste("0", pref_code, sep = ""))
  }
  else{
    pref_code <- pref_code
  }
  download_dir <- paste(as.character(pref_code), "農林業センサス2015", sep = "")
  df <- agribbit2::agri.read_as_csv(download_dir)
  unlink(download_dir, recursive = T)
  df <- df %>%
    mutate(KEY_CODE = as.numeric(KEY_CODE))
  return(df)
}



