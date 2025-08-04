import 'package:node_labs_movie_app/core/base/bloc/base_bloc_state.dart';

final class LoginState extends BaseBlocState {
  const LoginState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.isRegister = false,
    this.loginSuccess = false,
    this.obscureFirstPassword = false,
    this.obscureSecondPassword = false,
  });

  final bool isRegister;
  final bool loginSuccess;
  final bool obscureFirstPassword;
  final bool obscureSecondPassword;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      isRegister,
      loginSuccess,
      obscureFirstPassword,
      obscureSecondPassword,
    ];
  }

  @override
  LoginState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    bool? isRegister,
    bool? loginSuccess,
    bool? obscureFirstPassword,
    bool? obscureSecondPassword,
  }) {
    return LoginState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      isRegister: isRegister ?? this.isRegister,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      obscureFirstPassword: obscureFirstPassword ?? this.obscureFirstPassword,
      obscureSecondPassword: obscureSecondPassword ?? this.obscureSecondPassword,
    );
  }
}