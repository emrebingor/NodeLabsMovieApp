import 'dart:io';
import 'package:node_labs_movie_app/core/base/bloc/base_bloc_state.dart';

final class ProfileDetailState extends BaseBlocState {
  const ProfileDetailState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.selectedImage,
    this.loginSuccess = false,
  });

  final File? selectedImage;
  final bool loginSuccess;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      selectedImage,
      loginSuccess,
    ];
  }

  @override
  ProfileDetailState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    bool? loginSuccess,
    File? selectedImage,
  }) {
    return ProfileDetailState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }
}