import 'package:node_labs_movie_app/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_labs_movie_app/data/provider/selected_movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:node_labs_movie_app/core/bloc_providers.dart';

void main() {
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...appBlocProviders,
        ChangeNotifierProvider(create: (_) => SelectedMovieProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}