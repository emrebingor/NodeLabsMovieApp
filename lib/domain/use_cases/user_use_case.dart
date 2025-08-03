import 'package:node_labs_movie_app/data/repository/user_repository.dart';
import 'package:node_labs_movie_app/models/register_response_model.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<UserResponseModel> getUser() async=> await _repository.getUser();
}