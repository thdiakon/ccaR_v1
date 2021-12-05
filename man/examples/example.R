DATASET<-read.csv(system.file('extdata','miyazaki2017CCA.csv', package = 'ccaR') ,sep = ";")
ccaM<-cca(DATASET)

