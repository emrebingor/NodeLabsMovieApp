import 'package:dio/dio.dart';
import 'package:node_labs_movie_app/models/register_response_model.dart';
import 'package:node_labs_movie_app/utils/authentication_manager.dart';
import 'package:node_labs_movie_app/utils/network/network_manager.dart';

class LoginRepository {
  final networkManager = NetworkManager();
  final authManager = AuthenticationManager();

  Future<UserResponseModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final Response response = await networkManager.post(
        '/user/register',
        data: {
          'email': email,
          'name': name,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final userModel = UserResponseModel.fromJson(response.data);
        final token = userModel.data?.token ?? '';

        if (token != '') {
          networkManager.setAuthToken(token);
          authManager.setToken(token);
        }

        return userModel;
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserResponseModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await networkManager.post(
        '/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final userModel = UserResponseModel.fromJson(response.data);
        final token = userModel.data?.token ?? "";

        if (token != '') {
          networkManager.setAuthToken(token);
          authManager.setToken(token);
        }

        return userModel;
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
