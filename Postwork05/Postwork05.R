"1. A partir del conjunto de datos de soccer de la liga española de las temporadas 2017/2018, 
  2018/2019 y 2019/2020, crea el data frame SmallData, que contenga las columnas 
  date, home.team, home.score, away.team y away.score; 
  esto lo puede hacer con ayuda de la función select del paquete dplyr.
  Luego establece un directorio de trabajo y con ayuda de la función write.csv 
  guarda el data frame como un archivo csv con nombre soccer.csv. 
  Puedes colocar como argumento row.names = FALSE en write.csv."

suppressMessages(suppressWarnings(library(dplyr)))
library(dplyr)
library(lubridate)
library(fbRanks)

setwd ("C:/Users/arraz/Documents/Bedu_statisticsWithR/ligaesp") #Ponemos la dirección del directorio en el cual trabajaremos

#guardamos los links ena variable 
le11920 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
le11819 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
le11718 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"

#descargamos los links de cada variable y los almacenamos con archivos csv en nuestro directorio
download.file(url = le11920, destfile = "le1-1920.csv", mode = "wb")
download.file(url = le11819, destfile = "le1-1829.csv", mode = "wb")
download.file(url = le11718, destfile = "le1-1719.csv", mode = "wb")

dir() 
# leemos los archivos descargados usando la funcion lapply y guardandolos en un dataframe
ligaesp <- lapply(dir(), read.csv)

#seleccionamos las columnas que utilizaremos date, home.team, home.score, away.team y away.score; 
ligaesp <- lapply(ligaesp, select, c("Date", "HomeTeam", "AwayTeam", "HS", "AS")) 

#estandarizamos la variable que contiene fecha como date y ponemos un mismo formato de fecha en cada data frame
ligaesp[1] <- lapply(ligaesp[1],mutate,Date=as.Date(Date,"%d/%m/%y"))
ligaesp[2] <- lapply(ligaesp[2],mutate,Date=as.Date(Date,"%d/%m/%Y"))
ligaesp[3] <- lapply(ligaesp[3],mutate,Date=as.Date(Date,"%d/%m/%Y"))
str(ligaesp)

#creamos el archivo SmallData usando do-call
SmallData <- do.call(rbind, ligaesp)
str(SmallData)

#cambiamos el nombre de las columnas para que podamos usarlas facilmente con la libreria fbRanks
SmallData <- rename(SmallData, home.team= HomeTeam, away.team = AwayTeam,
                    home.score= HS, away.score =AS)
head(SmallData)

#guardamo el data frame como un archivo csv llamado soccer.csv. 
write.csv(SmallData, "soccer.csv", row.names = FALSE)

"2. Con la función create.fbRanks.dataframes del paquete fbRanks importe el archivo soccer.csv 
  a R y al mismo tiempo asignelo a una variable llamada listasoccer. Se creará una lista con los
  elementos scores y teams que son data frames listos para la función rank.teams. 
  Asigna estos data frames a variables llamadas anotaciones y equipos."

#leemos el archivo anteriormente guardado y lo asignamos a un data frame "listasoccer"
soccer <- read.csv("C:/Users/arraz/Documents/Bedu_statisticsWithR/ligaesp/soccer.csv")
listasoccer<-create.fbRanks.dataframes("soccer.csv")

#creamos las listas anotaciones y equipos con base a las columnas de nuestro dataframe "listasoccer" 
anotaciones <-listasoccer$scores
equipos <-listasoccer$teams
head(anotaciones)
head(equipos)

"3. Con ayuda de la función unique crea un vector de fechas (fecha) que no se repitan y que
correspondan a las fechas en las que se jugaron partidos. Crea una variable llamada n que 
contenga el número de fechas diferentes. 
Posteriormente, con la función rank.teams y usando 
como argumentos los data frames anotaciones y equipos, crea un ranking de equipos usando 
únicamente datos desde la fecha inicial y hasta la penúltima fecha en la que se jugaron partidos, 
estas fechas las deberá especificar en max.date y min.date. Guarda los resultados con el nombre ranking."

#por medio de unique extraemos las fechas unicas de nuestra columna date, obteniendo 382 fechas
fecha<-unique(anotaciones$date)
head (fecha)

n<-length(fecha)

#creamos el ranking idicando la la fecha inicial y la penultima fecha usando nuestra lista de fechas y accediendo a ellas por medio de sus posiciones
ranking <-rank.teams(anotaciones, equipos, max.date=fecha[n-1], min.date = fecha[1])

"4. Finalmente estima las probabilidades de los eventos, el equipo de casa gana, el equipo 
visitante gana o el resultado es un empate para los partidos que se jugaron en la última fecha
del vector de fechas fecha. Esto lo puedes hacer con ayuda de la función predict y usando como 
argumentos ranking y fecha[n] que deberá especificar en date."

predict(ranking, date = fecha[n])
