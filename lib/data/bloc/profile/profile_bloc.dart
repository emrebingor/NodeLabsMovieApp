import 'package:node_labs_movie_app/core/base/bloc/base_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_event.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_state.dart';
import 'package:node_labs_movie_app/data/repository/movie_repository.dart';
import 'package:node_labs_movie_app/data/repository/user_repository.dart';
import 'package:node_labs_movie_app/domain/use_cases/movie_use_case.dart';
import 'package:node_labs_movie_app/domain/use_cases/user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileBloc extends BaseBloc<ProfileAction, ProfileState> {
  final UserUseCase _userUseCase;
  final MovieUseCase _movieUseCase;

  ProfileBloc({UserUseCase? userUseCase, MovieUseCase? movieUseCase})
      : _userUseCase = userUseCase ?? UserUseCase(UserRepository()),
        _movieUseCase = movieUseCase ?? MovieUseCase(MovieRepository()),
        super(const ProfileState()) {
    on<ProfileInitAction>(_profileInitAction);
  }

  void updateOfferSheetStatus(bool isOfferSheet) {
    emit(state.copyWith(isOfferSheet: isOfferSheet));
  }

  Future<void> _profileInitAction(
      ProfileInitAction event,
      Emitter<ProfileState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final userResponse = await _userUseCase.getUser();
      final favoriteMoviesResponse = await _movieUseCase.getFavoriteMovies();

      emit(state.copyWith(
        isLoading: false,
        favoriteMovies: favoriteMoviesResponse.data,
        userData: userResponse.data,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}