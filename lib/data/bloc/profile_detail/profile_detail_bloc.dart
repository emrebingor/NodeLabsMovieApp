import 'dart:io';
import 'package:node_labs_movie_app/core/base/bloc/base_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_event.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_state.dart';
import 'package:node_labs_movie_app/data/repository/user_repository.dart';
import 'package:node_labs_movie_app/domain/use_cases/user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileDetailBloc extends BaseBloc<ProfileDetailAction, ProfileDetailState> {
  final UserUseCase _userUseCase;

  ProfileDetailBloc({UserUseCase? userUseCase})
      : _userUseCase = userUseCase ?? UserUseCase(UserRepository()),
        super(const ProfileDetailState()) {
    on<UpdatePhotoAction>(_updatePhotoAction);
  }

  Future<void> _updatePhotoAction(
      UpdatePhotoAction event,
      Emitter<ProfileDetailState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _userUseCase.uploadPhoto(state.selectedImage!);
      emit(state.copyWith(
        isLoading: false,
        loginSuccess: true,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void updateSelectedImage(File selectedImage) {
    emit(state.copyWith(selectedImage: selectedImage));
  }
}