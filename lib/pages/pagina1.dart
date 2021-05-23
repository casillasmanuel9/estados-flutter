import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () => usuarioCubit.borrarUsuario())
        ],
      ),
      body: BodyScafflod(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScafflod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {
      switch (state.runtimeType) {
        case UsuarioInitial:
          return Center(
            child: Text('No hay información del usuario'),
          );
        case UsuarioSeleccionado:
          return InformacionUsuario((state as UsuarioSeleccionado).usuario);
        default:
          return Center(
            child: Text('Estado no reconocido'),
          );
      }
      // if ( state is UsuarioInitial ) {
      //   return Center(
      //     child: Text('No hay información del usuario'),
      //   );
      // } else if(state is UsuarioSeleccionado){
      //   return InformacionUsuario(state.usuario);
      // } else {
      //   return Center(
      //     child: Text('Estado no reconocido'),
      //   );
      // }
    });
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(title: Text('Nombre: ${usuario.nombre}')),
            ListTile(title: Text('Edad: ${usuario.edad}')),
            Text(
              'Profeciones',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Divider(),
            // ListTile(title: Text('Profecion 1: '))
            ...usuario.profesiones.map((e) => ListTile(
                  title: Text(e),
                ))
          ],
        ),
      ),
    );
  }
}
