import 'package:node_labs_movie_app/components/app_bar/app_bar_widget.dart';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/base/view/base_view.dart';
import 'package:node_labs_movie_app/core/navigation/route_paths.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_event.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_state.dart';
import 'package:node_labs_movie_app/screen/profile/mixin/profile_screen_mixin.dart';
import 'package:node_labs_movie_app/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:node_labs_movie_app/models/register_response_model.dart';
import 'package:node_labs_movie_app/models/favorite_movie_response_model.dart';

part './sub_screen/user_information_widget.dart';
part './sub_screen/empty_favorite_list_widget.dart';
part './sub_screen/favorite_movie_list_widget.dart';

final class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final class _ProfileScreenState extends BaseViewState<ProfileScreen> with ProfileScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileBloc, ProfileAction, ProfileState>(
      blocModel: profileBloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: listener,
          builder: (BuildContext context, ProfileState state) {
            return Scaffold(
              appBar: AppBarWidget(
                title: "Profil Detayı",
                isActionVisible: true,
                isLeadingVisible: false,
                actionOnTap: () {
                  profileBloc.updateOfferSheetStatus(true);
                },
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _UserInformationRowWidget(
                      user: state.userData,
                    ),

                    const SizedBox(height: 29),

                    Text(
                      "Beğendiğim Filmler",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    state.favoriteMovies?.isNotEmpty ?? false ? _FavoriteListWidget(
                      movies: state.favoriteMovies,
                    ) : _EmptyListWidget(),
                  ],
                ),
              ),
            ).withLoading(state.isLoading);
          }
      ),
    );
  }
}
