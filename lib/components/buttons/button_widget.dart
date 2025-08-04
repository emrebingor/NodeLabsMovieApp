import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

final class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
            color: ColorExtension.red,
            borderRadius: BorderRadius.circular(18)
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: ColorExtension.white,
          ),
        ),
      ),
    );
  }
}
