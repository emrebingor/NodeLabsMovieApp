import 'package:node_labs_movie_app/core/base/bloc/base_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_event.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_state.dart';
import 'package:node_labs_movie_app/data/repository/movie_repository.dart';
import 'package:node_labs_movie_app/domain/use_cases/movie_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeBloc extends BaseBloc<HomeAction, HomeState> {
  final MovieUseCase _movieUseCase;

  HomeBloc({MovieUseCase? movieUseCase})
      : _movieUseCase = movieUseCase ?? MovieUseCase(MovieRepository()),
        super(const HomeState()) {
    on<HomeInitAction>(_homeInitAction);
  }

  Future<void> _homeInitAction(
      HomeInitAction event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final movieResponse = await _movieUseCase.getMovies();
      emit(state.copyWith(
        movies: movieResponse.data?.movies ?? [],
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
