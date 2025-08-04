import 'package:node_labs_movie_app/models/movie_response_model.dart';
import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

final class MovieInformationBoxWidget extends StatelessWidget {
  const MovieInformationBoxWidget({super.key, required this.movie, required this.onTap});
  final Movies movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final imageUrl = (movie.Poster ?? '').replaceFirst('http://', 'https://');
    return InkWell(
      onTap: onTap,
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
                color: ColorExtension.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),

          movie.Director != null && movie.Director != 'N/A' ? Align(
            alignment: Alignment.centerLeft,
            child: Text(
              movie.Director!,
              style: TextStyle(
                color: ColorExtension.white.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
