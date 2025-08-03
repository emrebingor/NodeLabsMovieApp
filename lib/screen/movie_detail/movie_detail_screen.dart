import 'package:node_labs_movie_app/components/app_bar/app_bar_widget.dart';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/base/view/base_view.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_event.dart';
import 'package:node_labs_movie_app/data/bloc/movie_detail/movie_detail_state.dart';
import 'package:node_labs_movie_app/data/provider/selected_movie_provider.dart';
import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/screen/movie_detail/mixin/movie_detail_screen_mixin.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

final class _MovieDetailScreenState extends BaseViewState<MovieDetailScreen> with MovieDetailScreenMixin {
  @override
  Widget build(BuildContext context) {
    final selectedMovie = context.read<SelectedMovieProvider>().selectedMovie;
    return BaseView<MovieDetailBloc, MovieDetailAction, MovieDetailState>(
      blocModel: movieDetailBloc,
      child: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: (BuildContext context, MovieDetailState state) {},
        builder: (BuildContext context, MovieDetailState state) {
          return Scaffold(
            appBar: AppBarWidget(title: 'Movie Detail'),
            body: Column(
              children: [
                SizedBox(
                  height: 360,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: selectedMovie?.images?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        (selectedMovie?.images?[index] ?? '').replaceFirst('http://', 'https://'),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ImagePathEnum.DETAIL_ICON.getImagePath),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [

                                    Text(
                                      selectedMovie?.Title ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),

                                    Spacer(),

                                    InkWell(
                                      onTap: () {
                                        if(selectedMovie?.id != null) {
                                          addFavorite(selectedMovie!.id!);
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white.withOpacity(0.3)),
                                            borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: SvgPicture.asset(
                                          ImagePathEnum.LIKE.getImagePath,
                                          color: state.isFavoriteSelected ? Colors.red : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  selectedMovie?.Plot ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
