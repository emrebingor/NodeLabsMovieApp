import 'package:node_labs_movie_app/core/base/bloc/base_bloc_state.dart';
import 'package:node_labs_movie_app/models/movie_response_model.dart';

final class HomeState extends BaseBlocState {
  const HomeState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.movies,
  });

  final List<Movies>? movies;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      movies,
    ];
  }

  @override
  HomeState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    List<Movies>? movies,
  }) {
    return HomeState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
    );
  }
}