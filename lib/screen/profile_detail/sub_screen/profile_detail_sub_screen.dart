part of '../profile_detail_screen.dart';

final class _ImageBoxWidget extends StatelessWidget {
  const _ImageBoxWidget({
    required this.selectedImage,
    required this.onTap,
  });

  final File? selectedImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(70),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(31)
        ),
        child: selectedImage != null ? ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.file(
            selectedImage!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ) : SvgPicture.asset(ImagePathEnum.PLUS_ICON.getImagePath),
      ),
    );
  }
}