import 'package:node_labs_movie_app/core/base/bloc/base_bloc_state.dart';
import 'package:node_labs_movie_app/models/register_response_model.dart';
import 'package:node_labs_movie_app/models/favorite_movie_response_model.dart';

final class ProfileState extends BaseBlocState {
  const ProfileState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.isOfferSheet = false,
    this.favoriteMovies,
    this.userData,
  });

  final bool isOfferSheet;
  final User? userData;
  final List<Movies>? favoriteMovies;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      isOfferSheet,
      favoriteMovies,
      userData,
    ];
  }

  @override
  ProfileState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    bool? isOfferSheet,
    List<Movies>? favoriteMovies,
    User? userData,
  }) {
    return ProfileState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      isOfferSheet: isOfferSheet ?? this.isOfferSheet,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      userData: userData ?? this.userData,
    );
  }
}