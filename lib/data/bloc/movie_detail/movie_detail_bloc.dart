import 'package:node_labs_movie_app/core/base/bloc/base_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_event.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_state.dart';
import 'package:node_labs_movie_app/data/repository/movie_repository.dart';
import 'package:node_labs_movie_app/domain/use_cases/movie_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class MovieDetailBloc extends BaseBloc<MovieDetailAction, MovieDetailState> {
  final MovieUseCase _movieUseCase;

  MovieDetailBloc({MovieUseCase? movieUseCase})
      : _movieUseCase = movieUseCase ?? MovieUseCase(MovieRepository()),
        super(const MovieDetailState()) {
    on<AddFavoriteAction>(_addFavorite);
  }

  Future<void> _addFavorite(
      AddFavoriteAction event,
      Emitter<MovieDetailState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final movieResponse = await _movieUseCase.addFavorite(event.id);
      emit(state.copyWith(
        isLoading: false,
        isFavoriteSelected: true,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
