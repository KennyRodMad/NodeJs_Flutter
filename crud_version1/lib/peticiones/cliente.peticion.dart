/*En este código definimos una serie de funciones en Dart que utilizamos para 
interactuar con nuestra API RESTful. Estas funciones proporcionan una interfaz 
para realizar operaciones CRUD (crear, leer, actualizar, eliminar) en la API RESTful 
que maneja datos de clientes, utilizando el paquete http de Flutter para realizar 
solicitudes HTTP y el paquete dart:convert para manejar datos JSON.
*/

import 'dart:convert';
import 'package:crud_version1/modelos/cliente.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/*Con la función Future<List<Client>> listClients() async { ... } 
realizamos una solicitud HTTP GET para obtener una lista de clientes desde la API. 
Luego, utilizamos la función compute para realizar el procesamiento en segundo plano de los datos JSON recibidos. 
Retornamos una lista de objetos Client.*/
Future<List<Client>> listClients() async {
  final response = 
      await http.get(Uri.parse('http://192.168.101.73:3000/api/clientes'));
    return compute(decodeJson, response.body);
}

/*Con la función List<Client> decodeJson(String responseBody) { ... } convertimos 
el cuerpo de la respuesta HTTP (JSON) en una lista de objetos Client. 
Utilizamos la función fromJson de la clase Client para convertir cada objeto JSON en un objeto Client.*/
List<Client> decodeJson(String responseBody){
  //conevertimos el body de la respuesta a un JSON
  final myJson = json.decode(responseBody);

  //convertimos el JSON a un objeto de tipo Client y lo retornamos, en este caso es una lista de clientes
  return myJson['clientes'].map<Client>((json) => Client.fromJson(json)).toList();
}

/*Con la función mapClient(Client client, bool mapId) { ... } mapeamos un objeto Client 
a un mapa de datos que se enviará al servidor. Si mapId es true, se incluye el ID del cliente; 
de lo contrario, se omite ya que será autogenerado por la base de datos.*/
mapClient(Client client, bool mapId){
  Map data;
  //Cuando guardamos no enviamos el Id en el objeto porque es autogenerado por la base de datos
  if(!mapId){
    data = {
      'nombre': '${client.name}',
      'apellido': '${client.surname}',
      'telefono': '${client.phone}'
    };
    //si vamos a modificar enviamos el objeto cliente con su Id
  }else{
    data = {
      '_id': '${client.id}',
      'nombre': '${client.name}',
      'apellido': '${client.surname}',
      'telefono': '${client.phone}'
    };
  }

  return data;
}

/*Con la función Future<Client> addClient(Client client) async { ... } realizamos una solicitud HTTP POST 
para agregar un nuevo cliente a la API. Utilizamos la función mapClient para mapear el cliente a un mapa de datos 
y luego lo envía al servidor. Retornamos el cliente agregado.*/
Future<Client> addClient(Client client) async{
  var url = Uri.parse('http://192.168.101.73:3000/api/clientes/registro');
  var _body = json.encode(mapClient(client, false));

  var response = await http.post(url,
    headers: {'Content-Type': 'application/json; charset=UTF-8'}, 
    body: _body
  );

  if(response.statusCode == 200){
    return Client.fromJson(jsonDecode(response.body)['cliente']);
  }else{
    throw Exception('Error al intentar registrar el cliente');
  }
}

/*Con la función Future<Client> modifyClient(Client client) async { ... } realizamos una solicitud HTTP PUT 
para modificar un cliente existente en la API. Utiliza la función mapClient para mapear el cliente a un mapa de datos 
y luego lo envía al servidor. Retornamos el cliente modificado.*/
Future<Client> modifyClient(Client client) async {
  var url = Uri.parse('http://192.168.101.73:3000/api/clientes/modificar');
  var _body = json.encode(mapClient(client, true));

  var response = await http.put(url,
    headers: {'Content-Type': 'application/json; charset=UTF-8'}, 
    body: _body
  );

  if(response.statusCode == 200){
    return Client.fromJson(jsonDecode(response.body)['cliente']);
  }else{
    throw Exception('Error al intentar modificar el cliente');
  }
}

/*Con la función Future<Client> deleteClient(String clientId) async { ... } realizamos una solicitud HTTP DELETE 
para eliminar un cliente existente en la API. Retornamos el cliente eliminado*/
Future<Client> deleteClient(String clientId) async {
  final response = await http.delete(Uri.parse('http://192.168.101.73:3000/api/clientes/eliminar/$clientId'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'}, 
  );

  if(response.statusCode == 200){
    return Client.fromJson(jsonDecode(response.body)['cliente']);
  }else{
    throw Exception('Error al intentar eliminar el cliente');
  }

}