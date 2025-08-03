import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_bloc.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<LoginBloc>(
    create: (_) => LoginBloc(),
  ),
  BlocProvider<HomeBloc>(
    create: (_) => HomeBloc(),
  ),
  BlocProvider<ProfileBloc>(
    create: (_) => ProfileBloc(),
  ),
  BlocProvider<MovieDetailBloc>(
    create: (_) => MovieDetailBloc(),
  ),
];
