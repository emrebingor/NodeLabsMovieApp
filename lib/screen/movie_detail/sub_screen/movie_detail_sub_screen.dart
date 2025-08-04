part of '../movie_detail_screen.dart';

final class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.images,
  });

  final List<String>? images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: double.infinity,
      child: ListView.builder(
        itemCount: images?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            (images?[index] ?? '').replaceFirst('http://', 'https://'),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

final class _InformationRowWidget extends StatelessWidget {
  const _InformationRowWidget({
    required this.movie,
    required this.onTap,
    required this.isFavoriteSelected,
  });
  final Movies? movie;
  final VoidCallback onTap;
  final bool isFavoriteSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SvgPicture.asset(ImagePathEnum.DETAIL_ICON.getImagePath),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Text(
                    movie?.Title ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorExtension.white,
                    ),
                  ),

                  Spacer(),

                  InkWell(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorExtension.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: SvgPicture.asset(
                        ImagePathEnum.LIKE.getImagePath,
                        color: isFavoriteSelected ? ColorExtension.red : ColorExtension.white,
                      ),
                    ),
                  ),
                ],
              ),

              Text(
                movie?.Plot ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: ColorExtension.white.withOpacity(0.75),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
