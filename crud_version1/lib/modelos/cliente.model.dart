//En este código definimos una clase Client para representar objetos de tipo cliente.
class Client {
  var id;
  var name;
  var surname;
  var phone;

  /* Definimos un constructor nombrado llamado Client que inicializa las variables 
  de instancia de la clase con valores proporcionados opcionalmente al crear una nueva instancia de Client.*/
  Client({this.id, this.name, this.surname, this.phone});

  /*Definimos un método de fábrica llamado fromJson que convierte un mapa JSON en una instancia de Client.*/
  factory Client.fromJson(Map<String, dynamic> json){

    /*Dentro del método fromJson creamos y devolvemos una nueva instancia de Client utilizando el constructor 
    nombrado definido anteriormente. Los valores para las propiedades del cliente se obtienen del mapa JSON 
    proporcionado como argumento al método fromJson.*/
    return Client(
      id: json['_id'],
      name: json['nombre'],
      surname: json['apellido'],
      phone: json['telefono']

    );
  }
}