import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

extension WidgetExtension on Widget {
  Widget withLoading(bool isLoading) {
    return Stack(
      children: <Widget>[
        this,
        AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: isLoading ? Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(
                color: ColorExtension.white,
              ),
            ),
          ) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
