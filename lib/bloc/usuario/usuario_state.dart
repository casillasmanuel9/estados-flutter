part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {

}

class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;
  
}

class UsuarioSeleccionado extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioSeleccionado(this.usuario);
  
}