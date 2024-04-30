/*En este código configuramos un servidor Express con ciertas configuraciones de middleware y rutas, 
y lo exportamos para ser utilizado en otras partes de la aplicación.

Importamos los módulos express, morgan y cors. 
express lo utilizamos para crear el servidor web, 
morgan lo utilizamos para registrar solicitudes HTTP entrantes en la consola en un formato específico.
Y cors permite a nuestro servidor indicar el puerto de origen
*/

const express = require('express');
const morgan = require('morgan');
const cors = require('cors');

//Creamos una instancia de la aplicación Express llamada app.
const app = express();

/*Usamos express.urlencoded() para analizar las solicitudes con cuerpos codificados en URL. extended: true 
permitiendo el análisis de objetos anidados.*/
app.use(express.urlencoded({extended: true}));
/*Usamos express.json() para analizar las solicitudes con cuerpos JSON.*/
app.use(express.json());

app.use(cors());
/*Usamos morgan('dev') para registrar las solicitudes HTTP en la consola en un formato de registro de desarrollo.*/
app.use(morgan('dev'));
/*Usamos app.use(require('./routes/cliente.route')) para utilizar las rutas definidas en el archivo cliente.route.js 
que está en la carpeta routes. De este modo, las solicitudes que coincidan con las rutas definidas 
en ese archivo son manejadas por el enrutador especificado.*/
app.use(require('./routes/cliente.route'));

//Exportamos el objeto app para que pueda ser utilizado en otros archivos, como se hizo en el archivo index.js.
module.exports = {app};