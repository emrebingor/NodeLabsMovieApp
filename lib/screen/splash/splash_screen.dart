import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:node_labs_movie_app/screen/splash/mixin/splash_screen_mixin.dart';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';

final class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseViewState<SplashScreen> with SplashScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Image.asset(
          fit: BoxFit.cover,
          ImagePathEnum.SPLASH.getImagePath,
        ),
      ),
    );
  }
}
