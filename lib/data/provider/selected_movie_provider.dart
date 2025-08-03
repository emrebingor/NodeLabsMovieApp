import 'package:node_labs_movie_app/models/movie_response_model.dart';
import 'package:flutter/foundation.dart';

class SelectedMovieProvider extends ChangeNotifier {
  Movies? _selectedMovie;

  Movies? get selectedMovie => _selectedMovie;

  void selectMovie(Movies movie) {
    _selectedMovie = movie;
    notifyListeners();
  }

  void clearSelectedMovie() {
    _selectedMovie = null;
    notifyListeners();
  }
}