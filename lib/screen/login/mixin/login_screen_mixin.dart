import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/navigation/route_paths.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_event.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_state.dart';
import 'package:node_labs_movie_app/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

mixin LoginScreenMixin on BaseViewState<LoginScreen> {
  final LoginBloc _loginBloc = LoginBloc();
  LoginBloc get loginBloc => _loginBloc;
  late final TextEditingController _mailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _secondPasswordController;
  late final TextEditingController _fullNameController;

  TextEditingController get mailController => _mailController;
  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get secondPasswordController => _secondPasswordController;
  TextEditingController get passwordController => _passwordController;

  @override
  void initState() {
    super.initState();
    _mailController = TextEditingController();
    _secondPasswordController = TextEditingController();
    _passwordController = TextEditingController();
    _fullNameController = TextEditingController();
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    secondPasswordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  Future<void> listener(BuildContext context, LoginState state) async {
    if (state.loginSuccess) {
      context.push(RoutePaths.tab);
    }
  }

  Future<void> registerUser() async {
    final email = mailController.text.trim();
    final fullName = fullNameController.text.trim();
    final password = passwordController.text;
    final secondPassword = secondPasswordController.text;

    if (!_isValidEmail(email)) {
      _showError('Geçerli bir e-posta adresi giriniz.');
      return;
    }

    if (fullName.length < 2) {
      _showError('Ad soyad en az 2 karakter olmalıdır.');
      return;
    }

    if (password.isEmpty || secondPassword.isEmpty) {
      _showError('Şifre alanları boş bırakılamaz.');
      return;
    }

    if (password != secondPassword) {
      _showError('Şifreler birbiriyle uyuşmuyor.');
      return;
    }

    _loginBloc.add(
      RegisterUserAction(
        mailController.text,
        passwordController.text,
        fullNameController.text,
      ),
    );
  }

  Future<void> loginUser() async {
    final email = mailController.text.trim();
    final password = passwordController.text;

    if (!_isValidEmail(email)) {
      _showError('Geçerli bir e-posta adresi giriniz.');
      return;
    }

    if (password.isEmpty) {
      _showError('Şifreyi yanlış girdiniz.');
      return;
    }

    _loginBloc.add(
      LoginUserAction(
        mailController.text,
        passwordController.text,
      ),
    );
  }


  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  void _showError(String message) {
    if (!context.mounted) return;

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: ColorExtension.red,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        top: kToolbarHeight + 20,
        left: 20,
        right: 20,
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void updateRegisterStatus() {
    _loginBloc.updateRegisterStatus();
  }

  void updateObscureTextStatus() {
    _loginBloc.updateObscureTextStatus();
  }
}