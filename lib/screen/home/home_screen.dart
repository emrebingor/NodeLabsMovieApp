import 'package:node_labs_movie_app/components/boxes/movie_information_box_widget.dart';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/base/view/base_view.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_event.dart';
import 'package:node_labs_movie_app/data/bloc/home/home_state.dart';
import 'package:node_labs_movie_app/screen/home/mixin/home_screen_mixin.dart';
import 'package:node_labs_movie_app/utils/extension/widget_extension.dart';
import 'package:node_labs_movie_app/components/pagination_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_labs_movie_app/models/movie_response_model.dart';

part './sub_screen/home_sub_screen.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final class _HomeScreenState extends BaseViewState<HomeScreen> with HomeScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeBloc, HomeAction, HomeState>(
      blocModel: homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (BuildContext context, HomeState state) {},
        builder: (BuildContext context, HomeState state) {
          return Scaffold(
            body: SafeArea(
              child: _MoviePaginationViewWidget(
                movies: state.movies ?? [],
                hasMoreData: state.hasMoreData,
                paginationCallback: () async {
                  getMovies();
                },
                onTap: (movie) => detailNavigation(movie),
              ),
            ),
          ).withLoading(state.isLoading);
        },
      ),
    );
  }

}
