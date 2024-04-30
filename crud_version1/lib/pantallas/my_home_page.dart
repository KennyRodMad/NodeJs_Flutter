/*En este código definimos una pantalla principal de nuestra aplicación Flutter que muestra una lista de contactos. 
Permitiendo agregar, modificar y eliminar contactos. La aplicación utiliza un diseño de Material Design y gestiona 
las interacciones del usuario mediante diálogos de confirmación.

Importamos el framework de Material Design y las clases message_response.dart, modify_contac.dart, 
register_contact.dart, cliente.peticion.dart y cliente.model.dart
*/

import 'package:crud_version1/modelos/cliente.model.dart';
import 'package:crud_version1/pantallas/message_response.dart';
import 'package:crud_version1/pantallas/modify_contac.dart';
import 'package:crud_version1/pantallas/register_contact.dart';
import 'package:crud_version1/peticiones/cliente.peticion.dart';
import 'package:flutter/material.dart';



//En el constructor de MyHomePage, recibimos un título que se utiliza para la barra de aplicación.
class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _MyHomePage();

}

/*Definimos una clase MyHomePage que extiende StatefulWidget. 
Esta clase representa la pantalla principal de la aplicación.*/
class _MyHomePage extends State<MyHomePage> {
  @override
  /*En el método build, construimos la interfaz de usuario utilizando un Scaffold, 
  que es una estructura básica de diseño de la aplicación Flutter.*/
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: getClients(context, listClients()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                context, MaterialPageRoute(builder: (_) => RegisterContact())).then((newContact){
              setState((){
                  messageResponse(
                    context, newContact.name + " ha sido guardado...!");
              });
          });
        },
        /*Al hacer clic en el botón de agregar (floatingActionButton), se abre una pantalla para registrar un nuevo contacto.*/
        tooltip: "Agregar Contacto",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getClients(BuildContext context, Future<List<Client>> futureClient) {
    return FutureBuilder(
      future: futureClient,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if(snapshot.hasError){
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
          return (snapshot.data != null) ?
              clientList(snapshot.data):
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Sin Datos'),
                ),
              );
          default: return Text('Recarga la pantalla nuevammente....!');
              
        }
      },
    );
  }

  Widget clientList(List<Client> clients){      
    /*La parte principal de la interfaz de usuario es un ListView.builder, 
      que muestra la lista de contactos como ListTiles.*/
    return ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          /*Cada ListTile muestra el nombre, apellido y número de teléfono del contacto, 
          con opciones para modificarlo al hacer clic en él o eliminarlo al mantenerlo presionado.*/
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => ModifyContact(clients[index])
                )).then((newContact){
                    setState(() {
                      messageResponse(context, newContact.name+" ha sido modificado...!");
                    });
                } );
            },
            onLongPress: () {
              removeClient(context, clients[index]);
            },

            title: Text(clients[index].name + " "+ clients[index].surname),
            subtitle: Text(clients[index].phone),
            leading: CircleAvatar(
              child: Text(clients[index].name.substring(0,1)),
            ),
            trailing: Icon(
              Icons.call,
              color: Colors.red,
            ),
          );
        },
      );
  }

  removeClient(BuildContext context, Client client){
    showDialog(
      /*Cuando se elimina un contacto, se muestra un diálogo de confirmación antes de realizar la eliminación.*/
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Eliminar Contacto"),
        content: Text("¿Está seguro de eliminar a "+client.name+"?"),
        actions: [
          TextButton(
            onPressed: () {
              deleteClient(client.id).then((value){
                if(value.id != ''){
                  setState(() {});
                  Navigator.pop(context);
                }
              });
            },
            child: Text("Eliminar", style: TextStyle(
              color: Colors.red
            ),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancelar", style: TextStyle(
              color: Colors.blue,
            ),),
          )
        ],
      )
    );
  }

}
