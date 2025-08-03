import 'package:node_labs_movie_app/data/repository/user_repository.dart';
import 'package:node_labs_movie_app/models/register_response_model.dart';
import 'package:node_labs_movie_app/models/update_photo_response_model.dart';
import 'dart:io';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<UserResponseModel> getUser() async=> await _repository.getUser();
  Future<UpdatePhotoResponseModel> uploadPhoto(File image) async=> await _repository.updatePhoto(image: image);
}