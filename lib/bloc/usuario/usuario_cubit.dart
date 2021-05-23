

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:meta/meta.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarEstado(Usuario user){
    emit(UsuarioSeleccionado(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if(currentState is UsuarioSeleccionado) {
      final user = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioSeleccionado(user));
    }
  }

  void agregarProfecciones() {
     final currentState = state;
     if(currentState is UsuarioSeleccionado) {
       final List<String> profeciones = [
         ...currentState.usuario.profesiones,
         'Profecion ${currentState.usuario.profesiones.length + 1}'
        ];
       final user = currentState.usuario.copyWith(profesiones: profeciones);
       emit(UsuarioSeleccionado(user));

     }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }

}