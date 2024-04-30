/*
En este código definimos una función llamada messageResponse que muestra 
un diálogo de alerta con un mensaje informativo en una aplicación Flutter.

Importamos la biblioteca necesaria de Flutter (flutter/material.dart).
*/

import 'package:flutter/material.dart';

/*Definimos una función llamada messageResponse que toma dos parámetros: BuildContext context y String name.*/
messageResponse(BuildContext context, String name){
  /*Dentro de la función, llamamos a showDialog para mostrar un diálogo de alerta. 
  Este diálogo de alerta tiene un título fijo ("Mensaje Informativo...!") y muestra 
  el nombre del contacto proporcionado (name) como contenido.*/
  showDialog(
    context: context, 
    builder: (_) => AlertDialog(
      title: Text("Mensaje Informativo...!"),
      content: Text("El contacto "+ name),
    ));
}

/*Una vez que llamamos a messageResponse, se muestra el diálogo de alerta en el contexto dado.*/