//requerimos el modelo de cliente
const clienteModel = require('../models/cliente.model');

/*Definimos una clase ClienteService que nos proporciona métodos para interactuar 
con la colección de clientes en la base de datos. Esta clase encapsula la lógica relacionada 
con la manipulación de datos de clientes.
*/
class ClienteService {
    ClienteService() {}

    /*consultarClientes() nos devuelve una lista de todos los clientes en la base de datos. 
    Utilizamos find() de clienteModel para obtener todos los documentos de la colección de clientes.*/
    async consultarClientes(){
        try {
            return await clienteModel.find();
        } catch (error){
            return error;
        }
    }

    /*guardarCliente(cliente) guarda un nuevo cliente en la base de datos. 
    Tomamos cliente como argumento, utilizamos el método create() de clienteModel 
    para crear un nuevo documento en la colección.*/
    async guardarCliente(cliente = new clienteModel()){
        try {
            var clienteGuardado;
            await clienteModel.create(cliente).then((value) => {
                clienteGuardado = value;            
            });

            return clienteGuardado;
        } catch (error) {
            console.log(error);
        }
    }

    /*eliminarCliente(idc) elimina un cliente de la base de datos dado su ID. 
    Utilizamos findOneAndDelete() del modelo de cliente para buscar y 
    eliminar el cliente correspondiente en función de su ID.*/
    async eliminarCliente(idc) {
        console.log(idc);
        try {
            const clienteEliminado = await clienteModel.findOneAndDelete({
                _id: idc
            });
    
            return clienteEliminado;
        } catch (error) {
            console.log(error);
            return error;
        }
    }

    /*modificarCliente(newCliente) modifica un cliente existente en la base de datos. 
    Tomamos un objeto newCliente que contiene los nuevos datos del cliente y 
    utilizamos el método findOneAndUpdate() del modelo de cliente para buscar y 
    actualizar el cliente correspondiente en función de su ID.*/
    async modificarCliente(newCliente){
        var clienteModificado;
        try {
            await clienteModel.findOneAndUpdate({
                _id: newCliente._id
            }, newCliente).then((value) => {
                clienteModificado = value;
            });

            return clienteModificado;
        } catch (error) {
            console.log(error);
        }
    }
    
}

/*La clase ClienteService se exporta como un singleton utilizando module.exports = new ClienteService(); 
Esta instancia se puede importar y utilizar en otras partes del código para realizar operaciones relacionadas 
con los clientes en la base de datos.*/
module.exports = new ClienteService();