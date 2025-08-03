import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_event.dart';
import 'package:node_labs_movie_app/screen/movie_detail/movie_detail_screen.dart';

mixin MovieDetailScreenMixin on BaseViewState<MovieDetailScreen> {
  final MovieDetailBloc _movieDetailBloc = MovieDetailBloc();
  MovieDetailBloc get movieDetailBloc => _movieDetailBloc;

  void addFavorite(String id) {
    _movieDetailBloc.add(AddFavoriteAction(id));
  }
}