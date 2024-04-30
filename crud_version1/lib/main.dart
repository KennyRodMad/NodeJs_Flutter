/*Es nuestra clase principal, desde donde se ejecuta nuestra app. 
En este código utilizamos el framework de Material Design, 
el cual proporciona widgets predefinidos y herramientas que facilitan la creación 
de aplicaciones con un aspecto visual moderno y consistente.
*/
//Importamos el paquete que contiene la clase my_home_page.dart
import 'pantallas/my_home_page.dart';
import 'package:flutter/material.dart';

//en el método main, instanciamos MyApp y se ejecuta la aplicación Flutter como se explicó anteriormente.
void main() => runApp(const MyApp());

//Definimos la clase MyApp que extiende StatelessWidget. Esta clase representa la aplicación principal.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//El método build, devuelve un MaterialApp, que es el widget raíz de la aplicación Flutter.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*Dentro del MaterialApp, establecemos algunas configuraciones, 
      como desactivar el banner de depuración y establecer el título de la aplicación.*/
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 239, 100, 6)),
        useMaterial3: true,
      ),
      /*El widget principal de la aplicación (home) es MyHomePage, 
      que se encuentra en otro archivo (my_home_page.dart). Le pasa el título Mis Contactos.*/
      home: MyHomePage("Mis Contactos"),
    );
  }
}