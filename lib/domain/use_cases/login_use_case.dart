import 'package:node_labs_movie_app/data/repository/login_repository.dart';
import 'package:node_labs_movie_app/models/register_response_model.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<UserResponseModel> registerUser(String email, String name, String password) async => await _repository.registerUser(email: email, name: name, password: password);
  Future<UserResponseModel> loginUser(String email, String password) async => await _repository.loginUser(email: email, password: password);
}