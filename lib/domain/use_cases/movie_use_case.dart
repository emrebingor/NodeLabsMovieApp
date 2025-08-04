import 'package:node_labs_movie_app/data/repository/movie_repository.dart';
import 'package:node_labs_movie_app/models/movie_response_model.dart';
import 'package:node_labs_movie_app/models/favorite_movie_response_model.dart';
import 'package:node_labs_movie_app/models/add_favorite_response_model.dart';

final class MovieUseCase {
  final MovieRepository _repository;

  MovieUseCase(this._repository);

  Future<MovieResponseModel> getMovies({int page = 1}) async =>
      await _repository.getMovies(page: page);

  Future<FavoriteMovieResponseModel> getFavoriteMovies() async =>
      await _repository.getFavoriteMovies();

  Future<AddFavoriteResponseModel> addFavorite(String id) async =>
      await _repository.addFavorite(id);
}