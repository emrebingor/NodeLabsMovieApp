import 'package:node_labs_movie_app/core/base/bloc/base_bloc_state.dart';
import 'package:node_labs_movie_app/models/movie_response_model.dart';

final class HomeState extends BaseBlocState {
  const HomeState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.movies,
    this.totalPages = 1,
    this.currentPage = 1,
    this.hasMoreData = true,
  });

  final List<Movies>? movies;
  final bool hasMoreData;
  final int totalPages;
  final int currentPage;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      movies,
      hasMoreData,
      totalPages,
      currentPage,
    ];
  }

  @override
  HomeState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    bool? hasMoreData,
    List<Movies>? movies,
    int? totalPages,
    int? currentPage,
  }) {
    return HomeState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}