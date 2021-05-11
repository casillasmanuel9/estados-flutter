
import 'package:flutter/cupertino.dart';
import 'package:flutter_estados/models/usuario.dart';

class UsuarioService with ChangeNotifier{
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario usuario) {
    this._usuario = usuario;
    notifyListeners();
  } 

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }
  
  void agregarProfecion() {
    this._usuario.profesiones.add('Profecion ${this._usuario.profesiones.length + 1}');
    notifyListeners();
  }

}