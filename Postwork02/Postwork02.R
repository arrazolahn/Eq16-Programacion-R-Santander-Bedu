  library(dplyr)
  library(lubridate)
  
  "Importamos los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la 
  primera división de la liga española a R,desde https://www.football-data.co.uk/spainm.php "
  setwd ("C:/Users/arraz/Documents/Bedu_statisticsWithR/spainleague") #Cambia el directorio al tuyo
  
  e11920 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
  e11819 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
  e11718 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
  
  download.file(url = e11920, destfile = "e1-1920.csv", mode = "wb")
  download.file(url = e11819, destfile = "e1-1829.csv", mode = "wb")
  download.file(url = e11718, destfile = "e1-1719.csv", mode = "wb")
  
  dir() 
  ligaesp <- lapply(dir(), read.csv) # leemos los archivos descargados usando la funcion lapply y guardandolos en un dataframe
  
  #Obtenemos una mejor idea de las características de los data frames al usar las funciones: str, head, View y summary
  str(ligaesp[[1]]); str(ligaesp[[2]]); str(ligaesp[[3]])
  head(ligaesp[[1]]); head(ligaesp[[2]]); head(ligaesp[[3]])
  View(ligaesp[[1]]); View(ligaesp[[2]]); View(ligaesp[[3]])
  summary(ligaesp[[1]]); summary(ligaesp[[2]]); summary(ligaesp[[3]])
  
  
  #Con la función select del paquete dplyr seleccionamos las columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR  para cada data frame.
  ligaesp <- lapply(ligaesp, select, c("Date", "HomeTeam", "AwayTeam", "FTHG", "FTAG", "FTR")) 
  
  "Aseguramos de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo 
   usamos as.Date y mutate para arreglar las fechas"
  
  ligaesp[[1]] <- mutate(ligaesp[[1]], Date = as.Date(Date, format="%d/%m/%y"))
  ligaesp[[2]] <- mutate(ligaesp[[2]], Date = as.Date(Date, "%d/%m/%Y"))
  ligaesp[[3]] <- mutate(ligaesp[[3]], Date = as.Date(Date, "%d/%m/%Y"))
  
  "Con la función rbind y do.call formamos un único data frame que contenga las seis columnas mencionadas en el punto 3"
  data <- do.call(rbind, ligaesp)
  head(data)
  dim(data)
  
  write.csv(data, "soccer.csv", row.names = FALSE)
  
