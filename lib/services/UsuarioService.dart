
import 'dart:async';

import 'package:flutter_estados/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario;
  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => this._usuarioStreamController.stream;

  Usuario get usuario => this._usuario;

  bool get existeUsuario => this._usuario != null ? true : false;

  void cargarUsuario(Usuario usuario) {
    this._usuario = usuario;
    this._usuarioStreamController.add(this._usuario);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    this._usuarioStreamController.add(this._usuario);
  }

  dispose() {
    this._usuarioStreamController?.close();
  }


}

final usuarioService = new _UsuarioService();