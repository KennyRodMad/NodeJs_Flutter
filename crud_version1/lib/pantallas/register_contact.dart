/*
  En este código implementamos una pantalla para registrar un nuevo contacto en la aplicación. 

  Importamos el framework de Material Design y las clases my_home_page.dart, text_box.dart. y 
  las clases cliente.model.dart, cliente.peticion.dart y text_box.dart
*/

import 'package:crud_version1/modelos/cliente.model.dart';
import 'package:crud_version1/peticiones/cliente.peticion.dart';
import 'package:flutter/material.dart';
import 'package:crud_version1/pantallas/text_box.dart';

/*Definimos una clase RegisterContact que extiende StatefulWidget. 
Esta clase representa la pantalla de registro de nuevos contactos.*/
class RegisterContact extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RegisterContact();

}

class _RegisterContact extends State<RegisterContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  /*En el método initState, inicializamos los controladores de texto para los campos de nombre, 
  apellido y teléfono*/
  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  /*En el método build, construimos la interfaz de usuario utilizando un Scaffold, 
  que es una estructura básica de diseño de la aplicación.*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Contactos"),
      ),
      /*La parte principal de la interfaz de usuario es un ListView que contiene varios TextBox para ingresar el nombre, 
      apellido y teléfono del contacto.*/
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
                  Client(name: name, surname: surname, phone: phone);
              addClient(c).then((value) => {
                  if(value.id != ''){
                    Navigator.pop(context, value)
                  }
              });
            }

          }, 
            /*Al final, hay un botón elevado ("Guardar Contacto") que guarda el contacto 
            si se han ingresado valores válidos en todos los campos, y luego regresa a la pantalla anterior 
            con los datos del nuevo contacto.*/
            child: Text("Guardar Contacto")
          ),

          ],
      )
    );

  }

}