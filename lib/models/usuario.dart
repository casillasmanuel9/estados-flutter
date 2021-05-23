
class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario({this.nombre, this.edad, this.profesiones});

  copyWith({
    String nombre,
    int edad, 
    List<String> profeciones
  }) 
    => Usuario(
      nombre: nombre ?? this.nombre, 
      edad: edad ?? this.edad, 
      profesiones: profeciones ?? this.profesiones
    );
  
}