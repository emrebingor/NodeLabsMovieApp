import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/screen/splash/splash_screen.dart';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/navigation/route_paths.dart';
import 'package:go_router/go_router.dart';

mixin SplashScreenMixin on BaseViewState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      onInitializationComplete();
    });
  }

  void onInitializationComplete() {
    context.push(RoutePaths.login);
  }
}