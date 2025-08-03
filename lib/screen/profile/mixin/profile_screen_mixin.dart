import 'dart:ui';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_event.dart';
import 'package:node_labs_movie_app/data/bloc/profile/profile_state.dart';
import 'package:node_labs_movie_app/screen/offer/offer_screen.dart';
import 'package:node_labs_movie_app/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin ProfileScreenMixin on BaseViewState<ProfileScreen> {
  final ProfileBloc _profileBloc = ProfileBloc();
  ProfileBloc get profileBloc => _profileBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileBloc.add(ProfileInitAction());
    });
  }

  Future<void> listener(BuildContext context, ProfileState state) async {
    if (state.isOfferSheet) {
      await showModalBottomSheet<void>(
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children:[
              InkWell(
                onTap: () {
                  _profileBloc.updateOfferSheetStatus(false);
                  context.pop();
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.80,
                  child: OfferScreen(),
                ),
              ),
            ],
          );
        },
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      ).whenComplete(() {
        if (state.isOfferSheet) {
          _profileBloc.updateOfferSheetStatus(false);
        }
      });
      return;
    }
  }
}