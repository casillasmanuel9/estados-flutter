import 'package:flutter/material.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:flutter_estados/services/UsuarioService.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: usuarioService.usuarioStream ,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
              return snapshot.hasData ? Text('${snapshot.data.nombre}') : Text('Pagina 2');
            },
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCustom(text: 'Establecer Usuario',onPress: () {
              final nuevoUsuario = new Usuario(nombre: 'Natasha', edad: 1);
              usuarioService.cargarUsuario(nuevoUsuario);
            },),
            ButtonCustom(text: 'Establecer Edad',onPress: (){
              usuarioService.cambiarEdad(30);
            },),
            ButtonCustom(text: 'Establecer Profeción',onPress: (){},)
          ],
        )));
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
