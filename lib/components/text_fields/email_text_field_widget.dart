import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

final class EmailTextFieldWidget extends StatelessWidget {
  const EmailTextFieldWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorExtension.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        children: [
          SvgPicture.asset(ImagePathEnum.MAIL.getImagePath),

          const SizedBox(width: 4),

          Expanded(
            child: TextFormField(
              controller: controller,
              style: TextStyle(color: ColorExtension.white),
              cursorColor: ColorExtension.white,
              decoration: InputDecoration(
                hintText: 'E-Posta',
                hintStyle: TextStyle(color: ColorExtension.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
