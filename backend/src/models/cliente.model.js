/* En este código definimos un modelo de datos llamado "Cliente" con tres campos (nombre, apellido y telefono) 
y lo exportamos para que pueda ser utilizado en otras partes de la aplicación. 

Importamos las clases Schema y model del paquete mongoose. 
Estas clases las utilizamos para definir esquemas y modelos de MongoDB, respectivamente.
*/
const { Schema, model } = require('mongoose');

/*Definimos un nuevo esquema llamado clienteSchema utilizando la clase Schema de Mongoose. 
Este esquema tiene tres campos: nombre, apellido y telefono, cada uno de tipo String.*/
const clienteSchema = new Schema({
    nombre: String,
    apellido: String,
    telefono: String
});

/*Utilizamos module.exports para exportar el modelo de Mongoose creado a partir del esquema y lo nombra como "Cliente". 
El método model() de Mongoose toma dos argumentos: el nombre del modelo (en este caso, "Cliente") y 
el esquema que se utilizará para este modelo (clienteSchema).*/
module.exports = model('Cliente', clienteSchema);