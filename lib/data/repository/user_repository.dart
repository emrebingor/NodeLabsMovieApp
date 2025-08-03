import 'package:dio/dio.dart';
import 'package:node_labs_movie_app/models/register_response_model.dart';
import 'package:node_labs_movie_app/utils/network/network_manager.dart';
import 'package:http_parser/http_parser.dart';

final class UserRepository {
  final NetworkManager _networkManager = NetworkManager();

  Future<UserResponseModel> getUser() async {
    try {
      final Response response = await _networkManager.get(
        '/user/profile',
      );

      if (response.statusCode == 200 && response.data != null) {
        return UserResponseModel.fromJson(response.data);
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
