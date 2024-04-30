/*En este código definimos las rutas y los controladores necesarios para manejar las operaciones CRUD 
(crear, leer, actualizar, eliminar) relacionadas con los clientes en la aplicación.*/

// Importamos la clase Router de Express para crear un nuevo enrutador.
const { Router } = require('express');
//Importamos los controladores de cliente desde el archivo cliente.controller.js. 
const { consultarClientes, guardarCliente, eliminarCliente, modificarCliente} = require('../controllers/cliente.controller');
// Creamos una instancia del enrutador de Express.
const router = Router();

/*Definimos una ruta GET para la consulta de todos los clientes. 
Cuando recibimos una solicitud GET en la ruta /api/clientes, el controlador consultarClientes 
se ejecutará para manejar la solicitud.*/
router.get('/api/clientes', consultarClientes);

/*Definimos una ruta POST para registrar un nuevo cliente. 
Cuando recibimos una solicitud POST en la ruta /api/clientes/registro, el controlador guardarCliente 
se ejecutará para manejar la solicitud.*/
router.post('/api/clientes/registro', guardarCliente);

/*Definimos una ruta DELETE para eliminar un cliente existente. 
Cuando recibimos una solicitud DELETE en la ruta /api/clientes/eliminar/:id, 
el controlador eliminarCliente se ejecutará para manejar la solicitud. 
El parámetro :id en la ruta indica que se espera un ID de cliente en la solicitud.*/
router.delete('/api/clientes/eliminar/:id', eliminarCliente);

/*Definimos una ruta PUT para modificar un cliente existente. 
Cuando recibimos una solicitud PUT en la ruta /api/clientes/modificar, 
el controlador modificarCliente se ejecutará para manejar la solicitud.*/
router.put('/api/clientes/modificar', modificarCliente);

//Exportamos el enrutador para que pueda ser utilizado en otras partes de la aplicación.
module.exports = router;
