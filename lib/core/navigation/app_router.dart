import 'package:node_labs_movie_app/screen/login/login_screen.dart';
import 'package:node_labs_movie_app/screen/tab/tab_screen.dart';
import 'package:node_labs_movie_app/screen/home/home_screen.dart';
import 'package:node_labs_movie_app/screen/profile/profile_screen.dart';
import 'package:node_labs_movie_app/screen/movie_detail/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.login,
  routes: [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.tab,
      builder: (context, state) => const TabScreen(),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutePaths.movieDetail,
      builder: (context, state) => const MovieDetailScreen(),
    ),
    GoRoute(
      path: RoutePaths.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.path}'),
    ),
  ),
);
