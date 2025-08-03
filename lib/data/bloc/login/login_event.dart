import 'package:flutter/material.dart';

@immutable
abstract class LoginAction {
  const LoginAction();
}

@immutable
final class RegisterUserAction extends LoginAction {
  const RegisterUserAction(this.email, this.password, this.name);
  final String email;
  final String password;
  final String name;
}

@immutable
final class LoginUserAction extends LoginAction {
  const LoginUserAction(this.email, this.password);
  final String email;
  final String password;
}