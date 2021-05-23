import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_estados/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_events.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(usuario: state.usuario.copyWith(edad: event.edad));
    } else if (event is AgregarProfecion) {
      final List<String> profeciones = [
        ...state.usuario.profesiones,
        'Profecion ${state.usuario.profesiones.length + 1}'
      ];
      yield state.copyWith(
          usuario: state.usuario.copyWith(profeciones: profeciones));
    } else if (event is BorrarUsuario) {
      yield state.initialState();
    }
  }
}
