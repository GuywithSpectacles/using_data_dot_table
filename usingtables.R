#Read Table from webpage
library(data.table)

tables <- html_nodes(file, 'table')

table1 <- html_table(tables[4], fill = TRUE)

?html_text


#Data Tables

DF <- data.frame(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(DF, 3)

DT <- data.table(x=rnorm(18), y=rep(c("a","b","c"),each=3), z=rnorm(18))
head(DT, 3)

tables()

DT[,list(mean(x), sum(z))]

#View y in table
DT[, table(y)]

table(DF$y)


#Adding new column

DT[, w:=z^2]

table(DF$z)

DT[,table(z)]


#Logical Operation for new Variables

table(DF$x)

DT[, a:=x>0]

table(DF$x)

DT[,table(x)]

DT[,table(w)]



#Merge data.table

DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)

DT2 <-data.table(x=c('a', 'b', 'dt2'), z=5:7)

setkey(DT1, x); setkey(DT2, x)

merge(DT1, DT2)

library(usethis)
use_github(protocol = 'https', auth_token = Sys.getenv("GITHUB_PAT") )
