import 'package:node_labs_movie_app/core/base/bloc/base_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_event.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_state.dart';
import 'package:node_labs_movie_app/data/repository/movie_repository.dart';
import 'package:node_labs_movie_app/domain/use_cases/movie_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_labs_movie_app/models/movie_response_model.dart';

final class HomeBloc extends BaseBloc<HomeAction, HomeState> {
  final MovieUseCase _movieUseCase;

  HomeBloc({MovieUseCase? movieUseCase})
      : _movieUseCase = movieUseCase ?? MovieUseCase(MovieRepository()),
        super(const HomeState()) {
    on<HomeInitAction>(_homeInitAction);
  }

  Future<void> _homeInitAction(HomeInitAction event, Emitter<HomeState> emit) async {
    if (state.currentPage > state.totalPages) return;

    emit(state.copyWith(isLoading: event.isPagination ? false : true));

    try {
      final response = await _movieUseCase.getMovies(page: state.currentPage);
      final List<Movies> newMovies = response.data?.movies ?? [];
      final List<Movies> allMovies = [...(state.movies ?? []), ...newMovies];

      final int newTotalPages = response.data?.pagination?.maxPage ?? 0;

      emit(state.copyWith(
        movies: allMovies,
        currentPage: state.currentPage + 1,
        totalPages: newTotalPages,
        isLoading: false,
        hasMoreData: state.currentPage < newTotalPages,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
