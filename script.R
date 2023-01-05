setwd("/home/uff/Área de Trabalho/arquivos/lorena/dados_fauna")

df <- read.csv("dados_fauna.txt", h=T, sep="\t")
head(df)

df<-df[,c(1,3,4,21,22,23,24,25)]
head(df)

for (col in 4:ncol(df)) {
  print(paste(names(df)[col]))
  print(shapiro.test(df[,col]))
}

for (col in 4:ncol(df)) {
  boxplot(df[,col] ~ df[,"Áreas"] * df[,"Prof"] * df[,"Coleta"], las=2, xlab="", main=paste(names(df)[col]))
  print(paste(names(df)[col]))
  print(kruskal.test(df[,col]~df[,"Áreas"]))
  print(kruskal.test(df[,col]~df[,"Prof"]))
  print(kruskal.test(df[,col]~df[,"Coleta"]))
  #print(wilcox.test(df[,col]~df[,"Prof"]))
  print(wilcox.test(df[,col]~df[,"Coleta"]))
  }
