#Utilizando el manejador de BDD Mongodb Compass (previamente instalado), deberás de realizar las siguientes acciones:
library("mongolite")

#Alojar el fichero match.data.csv en una base de datos llamada match_games, nombrando al collection como match
mongoDB <- mongo("match", url = "mongodb+srv://arrazolan:<Password>@cluster0.axpl7.mongodb.net/match_games?retryWrites=true&w=majority")

#Una vez hecho esto, realizar un count para conocer el número de registros que se tiene en la base
mongoDB$count()

"Realiza una consulta utilizando la sintaxis de Mongodb en la base de datos, 
para conocer el número de goles que metió el Real Madrid el 20 de diciembre de 2015 y 
contra que equipo jugó, ¿perdió ó fue goleada?"

golesRM201215 <- mongoDB$find(
  query = '{"Date":"2015-12-20","HomeTeam":"Real Madrid"}'
)
  
#Por último, no olvides cerrar la conexión con la BDD
rm(mongoDB)
