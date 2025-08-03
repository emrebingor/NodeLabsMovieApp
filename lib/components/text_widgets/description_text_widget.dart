import 'package:flutter/material.dart';

final class DescriptionTextWidget extends StatelessWidget {
  const DescriptionTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
