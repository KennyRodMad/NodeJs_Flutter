/*En este código definimos varios controladores de ruta para manejar las solicitudes HTTP 
relacionadas con operaciones de clientes. Los controladores utilizan el servicio clienteService 
para realizar operaciones en la base de datos. 
*/
const clienteService = require('../services/cliente.service');

/*Con consultarClientes(req, res) manejamos las solicitudes para consultar todos los clientes. 
Utilizamos consultarClientes() del servicio clienteService para obtener la lista de clientes desde la base de datos 
y luego envíamos la respuesta JSON con la lista de clientes.*/
const consultarClientes = async(req, res) => {
    res.json({
        clientes: await clienteService.consultarClientes()

    });
}

/*Con guardarCliente(req, res) manejamos las solicitudes para guardar un nuevo cliente. 
Obtenemos los datos del cliente del cuerpo de la solicitud (req.body), los pasamos al método guardarCliente() 
del servicio clienteService para guardar el cliente en la base de datos, y luego envíamos una respuesta JSON 
con el cliente recién guardado.*/
const guardarCliente = async(req, res) => {
    console.log(req.body);
    res.json({
        cliente: await clienteService.guardarCliente(req.body)
    });
}

/*Con eliminarCliente(req, res) manejamos las solicitudes para eliminar un cliente existente. 
Obtenemos el ID del cliente de los parámetros de la solicitud (req.params.id), lo pasamos al método eliminarCliente() 
del servicio clienteService para eliminar el cliente correspondiente en la base de datos, 
y luego envíamos una respuesta JSON con el cliente eliminado.
*/
const eliminarCliente = async(req, res) => {
    res.json({
        cliente: await clienteService.eliminarCliente(req.params.id)
    });
}

/*Con modificarCliente(req, res) manejamos las solicitudes para modificar un cliente existente. 
Obtenemos los datos del cliente actualizados del cuerpo de la solicitud (req.body), 
los pasamos al método modificarCliente() del servicio clienteService para actualizar el cliente correspondiente 
en la base de datos, y luego envíamos una respuesta JSON con el cliente modificado.*/
const modificarCliente = async(req, res) => {
    res.json({
        cliente: await clienteService.modificarCliente(req.body)
    });
}

/*exportamos los controladores como un objeto para que puedan ser utilizados como rutas en la configuración del enrutador. 
Esto permite que estos controladores se asocien con las rutas adecuadas en la aplicación 
para manejar las solicitudes HTTP entrantes*/
module.exports = {consultarClientes, guardarCliente, eliminarCliente, modificarCliente};