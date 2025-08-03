import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:flutter/material.dart';

final class IconTextBoxWidget extends StatelessWidget {
  const IconTextBoxWidget({super.key, required this.title, required this.icon});
  final String title;
  final ImagePathEnum icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 55,
            width: 55,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(240, 71, 3, 17),
              child: Image.asset(icon.getImagePath),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
