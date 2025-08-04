part of '../profile_screen.dart';

final class _FavoriteListWidget extends StatelessWidget {
  const _FavoriteListWidget({required this.movies});
  final List<Movies>? movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              childAspectRatio: 0.55,
            ),
            itemCount: movies?.length ?? 0,
            itemBuilder: (context, index) {
              final movie = movies?[index];
              final imageUrl = (movie?.Poster ?? '').replaceFirst('http://', 'https://');
              return movie != null ? InkWell(
                onTap: () {},
                child: Column(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl,
                        height: 216,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image);
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        movie.Title ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        movie.Director ?? '',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ) : SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}