import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

final class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ColorExtension.white,
      ),
    );
  }
}
