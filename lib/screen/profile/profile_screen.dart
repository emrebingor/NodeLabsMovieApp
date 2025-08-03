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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseViewState<ProfileScreen> with ProfileScreenMixin {
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
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image.network(
                              state.userData?.photoUrl ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(Icons.person),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.userData?.name ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "ID:${state.userData?.id ?? ''}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () => context.push(RoutePaths.profileDetail),
                          child: Container(
                            height: 36,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Fotoğraf Ekle",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
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

                    state.favoriteMovies?.isNotEmpty ?? false ? Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.55,
                            ),
                            itemCount: state.favoriteMovies?.length ?? 0,
                            itemBuilder: (context, index) {
                              final movie = state.favoriteMovies?[index];
                              final imageUrl = (movie?.Poster ?? '').replaceFirst('http://', 'https://');
                              return movie != null ? InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        imageUrl,
                                        height: 216,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Icon(Icons.broken_image);
                                        },
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        movie.Title ?? '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        movie.Director ?? '',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ) : SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                    ) : Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.movie, color: Colors.white),
                          ),
                          Text(
                            'Favorilerinizden film yok lütfen film ekleyiniz.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).withLoading(state.isLoading);
          }
      ),
    );
  }
}
