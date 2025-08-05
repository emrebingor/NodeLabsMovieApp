import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

final class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.visibleOnTap,
    required this.obscureText,
  });
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback visibleOnTap;

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
          SvgPicture.asset(ImagePathEnum.PASSWORD.getImagePath),

          const SizedBox(width: 4),

          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              style: TextStyle(color: ColorExtension.white),
              cursorColor: ColorExtension.white,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: ColorExtension.grey),
                border: InputBorder.none,
              ),
            ),
          ),

          InkWell(
            onTap: visibleOnTap,
            child: SvgPicture.asset(ImagePathEnum.VISIBLE.getImagePath),
          ),
        ],
      ),
    );
  }
}
