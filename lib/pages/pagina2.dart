import 'package:flutter/material.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:flutter_estados/services/usuarioService.dart';
import 'package:provider/provider.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: usuarioService.existeUsuario ? Text('${usuarioService.usuario.nombre}') : Text('Pagina 2')
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCustom(text: 'Establecer Usuario',onPress: (){
              final nuevoUsuario = new Usuario(nombre: 'Dayana', edad: 1, profesiones: ['Front End Developer', 'Back End Developer']);

              usuarioService.usuario = nuevoUsuario;
            },),
            ButtonCustom(text: 'Establecer Edad',onPress: (){
              usuarioService.cambiarEdad(30);
            },),
            ButtonCustom(text: 'Establecer Profeción',onPress: (){
              usuarioService.agregarProfecion();
            },)
          ],
        )
      )
    );
  }
}

class ButtonCustom extends StatelessWidget {
  final String text;
  final Function onPress;

  const ButtonCustom({Key key, @required this.text,@required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        '${this.text}',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: this.onPress,
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder()
      ),
    );
  }
}
