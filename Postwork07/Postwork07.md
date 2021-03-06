# Postwork Sesion 7. Alojar un fichero a un local host de MongoDB 

### Conocimientos Adquiridos

- Realizar el alojamiento de un fichero `.csv` a una base de datos (BDD), en un local host de Mongodb a través de `R`

#### Instrucciones

Utilizando el manejador de BDD _Mongodb Compass_ (previamente instalado), deberás de realizar las siguientes acciones: 

- Alojar el fichero  `match.data.csv` en una base de datos llamada `match_games`, nombrando al `collection` como `match`

- Una vez hecho esto, realizar un `count` para conocer el número de registros que se tiene en la base

- Realiza una consulta utilizando la sintaxis de **Mongodb** en la base de datos, para conocer el número de goles que metió el Real Madrid el 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió ó fue goleada?

- Por último, no olvides cerrar la conexión con la BDD
 
__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt

#### Solución
<br />
    <a href="Postwork02.R"><strong>Ver el código</strong></a>
    <br/>
1. Alojamos el fichero en mongo DB 

<p align="center">
    <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork07/imagenes/img1.PNG">
</p>

2.Realizamos un count obteniendo 3801 registros

```r
mongoDB$count()
```

3. Realizamos la consulta y no obtenemos registro alguno, así mismo cerramos la conexión a nuestra BDD en MongoDB 
   
```r
golesRM201215 <- mongoDB$find(
  query = '{"Date":"2015-12-20","HomeTeam":"Real Madrid"}'
)
rm(mongoDB)
```

<p align="center">
    <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork07/imagenes/img2.PNG">
</p>
