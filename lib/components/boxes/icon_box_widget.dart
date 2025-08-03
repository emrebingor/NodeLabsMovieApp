import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class IconBoxWidget extends StatelessWidget {
  const IconBoxWidget({super.key, required this.icon});
  final ImagePathEnum icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: SvgPicture.asset(icon.getImagePath),
    );
  }
}
