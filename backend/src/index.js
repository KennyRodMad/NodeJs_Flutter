/* En este código establecemos la conexión a la base de datos y luego iniciamos un servidor web en el puerto 3000.

Importamos dos módulos locales, app y dbConection, desde los archivos app.js y database.js respectivamente.
*/
const { app } = require('./app');
const { dbConection} = require('./database');

//Definimos una función asincrónica llamada main().
async function main () {
    /*Dentro de ella, primero llamamos a dbConection() 
    para conectarnos a la base de datos. Como la función dbConection() es asíncrona (await), 
    aseguramos que la conexión se establezca antes de continuar.*/ 
    await dbConection(); 
    /*Luego, una vez que la conexión a la base de datos fue establecida, llamamos a app.listen(3000). 
    Esto inicia el servidor en el puerto 3000. Siendo app una instancia de un servidor Express.*/
    await app.listen(3000);
}

main();