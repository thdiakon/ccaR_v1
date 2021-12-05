## code to prepare `dt` dataset goes here
dt<-read.csv(system.file('extdata','miyazaki2017CCA.csv', package = 'ccaR') ,sep = ";")
usethis::use_data(dt, overwrite = TRUE)
