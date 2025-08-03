import 'package:node_labs_movie_app/core/base/bloc/base_bloc_state.dart';

final class MovieDetailState extends BaseBlocState {
  const MovieDetailState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.isFavoriteSelected = false,
  });

  final bool isFavoriteSelected;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      isFavoriteSelected,
    ];
  }

  @override
  MovieDetailState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    bool? isFavoriteSelected,
  }) {
    return MovieDetailState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      isFavoriteSelected: isFavoriteSelected ?? this.isFavoriteSelected,
    );
  }
}