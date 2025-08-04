part of '../home_screen.dart';

final class _MoviePaginationViewWidget extends StatelessWidget {
  const _MoviePaginationViewWidget({
    required this.movies,
    required this.paginationCallback,
    required this.onTap,
    required this.hasMoreData
  });

  final List<Movies>? movies;
  final bool hasMoreData;
  final Future<void> Function() paginationCallback;
  final void Function(Movies movie) onTap;

  @override
  Widget build(BuildContext context) {
    if(movies == null) return SizedBox.shrink();
    if(movies == []) return SizedBox.shrink();
    return PaginationBuilder<Movies>(
      source: movies ?? [],
      isHaveMoreData: hasMoreData,
      paginationCallback: paginationCallback,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      scroll: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, movie) => MovieInformationBoxWidget(
        movie: movie,
        onTap: () => onTap(movie),
      ),
    );
  }
}