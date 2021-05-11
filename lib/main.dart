import 'package:flutter/material.dart';
import 'package:flutter_estados/pages/pagina1.dart';
import 'package:flutter_estados/pages/pagina2.dart';
import 'package:flutter_estados/services/usuarioService.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: true, create: (BuildContext context)  => UsuarioService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {'pagina1': (_) => Pagina1(), 'pagina2': (_) => Pagina2()},
      ),
    );
  }
}
