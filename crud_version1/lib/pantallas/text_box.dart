/*En este código definimos un widget personalizado llamado TextBox, 
que representa un campo de entrada de texto con una etiqueta y un botón para borrar el contenido.

Importamos la biblioteca necesaria de Flutter (flutter/material.dart).
*/

import 'package:flutter/material.dart';

//Definimos una clase llamada TextBox que extiende StatelessWidget.
class TextBox extends StatelessWidget{
  final TextEditingController _controller;
  final String _label;
  /*En el constructor de TextBox, se reciben un controlador de texto (_controller) y 
  una etiqueta (_label) como parámetro*/
  TextBox(this._controller,this._label);
  @override
  /*En el método build, construimos la interfaz de usuario del campo de entrada de texto utilizando un TextField.*/
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(15.0),
      /*El TextField utiliza el controlador _controller para manejar el texto ingresado por el usuario y 
      muestra la etiqueta _label como texto de ayuda.*/
      child: TextField(
        controller: this._controller,
        decoration: InputDecoration(
          filled: true,
          labelText: this._label,
          suffix: GestureDetector(
            /*Agregamos un botón (close) al final del campo de entrada de texto. Cuando se presiona, 
            se borra el contenido del campo de texto asociado (_controller) 
            utilizando el método clear() del controlador.*/
            child: Icon(Icons.close),
            onTap: () {
              _controller.clear();
            },
          )
        ),
      ),
    );
  }
  
}