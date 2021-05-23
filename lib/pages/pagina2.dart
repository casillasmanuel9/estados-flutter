import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/usuario/usuario_bloc.dart';
import 'package:flutter_estados/models/usuario.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina 2'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCustom(text: 'Establecer Usuario',onPress: (){
              usuarioBloc.add(ActivarUsuario(Usuario(
                edad: 24,
                nombre: 'Manuel',
                profesiones: [
                  'Front End Developer'
                ]
              )));
            },),
            ButtonCustom(text: 'Establecer Edad',onPress: (){
              usuarioBloc.add(CambiarEdad(20));
            },),
            ButtonCustom(text: 'Establecer Profeción',onPress: (){
              usuarioBloc.add(AgregarProfecion());
            },)
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
