/* En este código utilizamos Mongoose (una biblioteca de modelado de objetos MongoDB para Node.js) y 
definimos una función llamada dbConection que se encarga de establecer la conexión a una base de datos MongoDB.

Importamos el módulo mongoose para interactuar con la base de datos.
*/
const mongoose = require('mongoose');

/*Definimos una función asíncrona dbConection. Dentro de ella, utilizamos try...catch 
para manejar los errores durante la conexión a la base de datos e indica en un mensaje 
que se está conectando a la base de datos.
*/
const dbConection = async () => {
    try {
        console.log('Conectando DB..... ');

        //Utiliza mongoose.connect() para conectar a la base de datos MongoDB en la URL mongodb://127.0.0.1/myDataBase.
        await mongoose.connect('mongodb://127.0.0.1/myDataBase', {
            
        });
        //Si la conexión es exitosa, lo indicamos por mensaje. 
        console.log('Conectado..... :)');
    } catch (error) {
        //Si sucede un error durante la conexión, se lanza una instancia con el mensaje de error.
        throw new Error(error);
    }
}

/*exportamos la función dbConection para que pueda ser utilizada en otros archivos. 
En este caso, se exporta dentro de un objeto para que pueda ser importado como parte de un conjunto de funciones.
*/
module.exports = { dbConection };
