import 'package:dio/dio.dart';
import 'package:node_labs_movie_app/models/movie_response_model.dart';
import 'package:node_labs_movie_app/utils/authentication_manager.dart';
import 'package:node_labs_movie_app/utils/network/network_manager.dart';

final class MovieRepository {
  final networkManager = NetworkManager();
  final authManager = AuthenticationManager();

  Future<MovieResponseModel> getMovies({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final Response response = await networkManager.get(
        '/movie/list',
      );

      if (response.statusCode == 200 && response.data != null) {
        print(response.data);
        return MovieResponseModel.fromJson(response.data);
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
