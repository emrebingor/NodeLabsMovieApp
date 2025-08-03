import 'package:flutter/material.dart';

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
                color: Colors.white,
              ),
            ),
          ) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
