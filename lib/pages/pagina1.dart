import 'package:flutter/material.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:flutter_estados/services/UsuarioService.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData 
                ? InformacionUsuario(
                    usuario: snapshot.data,
                  )
                : Center(
                    child: Text('No hay información de usuario'),
                  );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({Key key, @required this.usuario}) : super(key: key);

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
            ListTile(title: Text('Profecion 1: ')),
            ListTile(title: Text('Profecion 1: ')),
            ListTile(title: Text('Profecion 1: '))
          ],
        ),
      ),
    );
  }
}
