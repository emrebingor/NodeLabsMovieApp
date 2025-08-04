import 'package:node_labs_movie_app/core/base/bloc/base_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_event.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_state.dart';
import 'package:node_labs_movie_app/data/repository/login_repository.dart';
import 'package:node_labs_movie_app/domain/use_cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class LoginBloc extends BaseBloc<LoginAction, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({LoginUseCase? loginUseCase})
      : _loginUseCase = loginUseCase ?? LoginUseCase(LoginRepository()),
        super(const LoginState()) {
    on<RegisterUserAction>(_registerUser);
    on<LoginUserAction>(_loginUser);
  }

  void updateRegisterStatus() {
    emit(state.copyWith(isRegister: !state.isRegister));
  }

  void updateObscureFirstPassword() {
    emit(state.copyWith(obscureFirstPassword: !state.obscureFirstPassword));
  }

  void updateObscureSecondPassword() {
    emit(state.copyWith(obscureSecondPassword: !state.obscureSecondPassword));
  }

  Future<void> _registerUser(
      RegisterUserAction event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _loginUseCase.registerUser(
        event.email,
        event.name,
        event.password,
      );

      emit(state.copyWith(
        isLoading: false,
        loginSuccess: true,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _loginUser(
      LoginUserAction event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _loginUseCase.loginUser(
        event.email,
        event.password,
      );
      emit(state.copyWith(
        isLoading: false,
        loginSuccess: true,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
