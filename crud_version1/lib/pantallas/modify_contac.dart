/* En este código definimos una pantalla para modificar un contacto existente en nuestra aplicación Flutter.

Importamos el framework de Material Design  y las clases cliente.model.dart, cliente.peticion.dart y text_box.dart.
*/

import 'package:crud_version1/modelos/cliente.model.dart';
import 'package:crud_version1/peticiones/cliente.peticion.dart';
import 'package:flutter/material.dart';
import 'package:crud_version1/pantallas/text_box.dart';

/*Definimos una clase ModifyContact que extiende StatefulWidget. 
Esta clase representa la pantalla de modificación de contactos.
*/
class ModifyContact extends StatefulWidget{
  final Client _client;
  ModifyContact(this._client);
  @override
  State<StatefulWidget> createState() => _ModifyContact();

}

/*En el constructor de ModifyContact, se recibe un objeto Client que representa el contacto a modificar.*/
class _ModifyContact extends State<ModifyContact>{

  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;
  late String id;

  /*En el método initState, inicializamos los controladores de texto para los campos de nombre, 
  apellido y teléfono con los valores del contacto existente.*/
  @override
  void initState() {
    Client c = widget._client;
    id = c.id;
    controllerName = TextEditingController(text: c.name);
    controllerSurname = TextEditingController(text: c.surname);
    controllerPhone = TextEditingController(text: c.phone);
    super.initState();
  }

  /*En el método build, construimos la interfaz de usuario utilizando un Scaffold, que es una estructura 
  básica de diseño de la aplicación Flutter.*/
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Contacto"),
      ),

      /*
        La parte principal de la interfaz de usuario es un ListView que contiene varios TextBox 
        para modificar el nombre, apellido y teléfono del contacto.
      */
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Teléfono"),

          ElevatedButton(onPressed: () {
            String name = controllerName.text;
            String surname = controllerSurname.text;
            String phone = controllerPhone.text;

            if  (name.isNotEmpty && 
                surname.isNotEmpty && 
                phone.isNotEmpty) {
              Client c = 
                  Client(id: id, name: name, surname: surname, phone: phone);
              modifyClient(c).then((value) => {
                  if(value.id != ''){
                    Navigator.pop(context, value)
                  }
              });
            }

          }, 
            /*Al final, hay un botón elevado ("Guardar Contacto") que guarda los cambios 
            si se han ingresado valores válidos en todos los campos, y luego regresa a la pantalla anterior 
            con los datos modificados del contacto.*/
            child: Text("Actualizar")
          ),
        ]
      ),
    );
  }

}