import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_estados/models/usuario.dart';



class Pagina2 extends StatelessWidget {
  const Pagina2({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubitUsuario = context.read<UsuarioCubit>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina 2'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCustom(text: 'Establecer Usuario',onPress: (){
              cubitUsuario.seleccionarEstado(new Usuario(
                edad: 24,
                nombre: 'Manuel',
                profesiones: [
                  'Front end developer',
                  'Back end developer'
                ]
              ));
            },),
            ButtonCustom(text: 'Establecer Edad',onPress: (){
              cubitUsuario.cambiarEdad(20);
            },),
            ButtonCustom(text: 'Establecer Profeción',onPress: (){
              cubitUsuario.agregarProfecciones();
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
