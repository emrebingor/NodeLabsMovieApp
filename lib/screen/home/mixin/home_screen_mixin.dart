import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/navigation/route_paths.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_event.dart';
import 'package:node_labs_movie_app/data/provider/selected_movie_provider.dart';
import 'package:node_labs_movie_app/models/movie_response_model.dart';
import 'package:node_labs_movie_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

mixin HomeScreenMixin on BaseViewState<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();
  HomeBloc get homeBloc => _homeBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeBloc.add(const HomeInitAction(false));
    });
  }

  void getMovies() {
    homeBloc.add(HomeInitAction(true));
  }

  void detailNavigation(Movies movie) {
    context.read<SelectedMovieProvider>().selectMovie(movie);
    context.push(RoutePaths.movieDetail);
  }
}