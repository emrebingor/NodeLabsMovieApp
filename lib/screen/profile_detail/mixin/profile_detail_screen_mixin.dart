import 'dart:io';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_event.dart';
import 'package:node_labs_movie_app/screen/profile_detail/profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_state.dart';

mixin ProfileDetailScreenMixin on BaseViewState<ProfileDetailScreen> {
  final ProfileDetailBloc _profileDetailBloc = ProfileDetailBloc();
  ProfileDetailBloc get profileDetailBloc => _profileDetailBloc;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Future<void> listener(BuildContext context, ProfileDetailState state) async {
    if (state.loginSuccess) {
      context.pop();
    }
  }

  void updateSelectedPhoto() {
    _profileDetailBloc.add(UpdatePhotoAction());
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _profileDetailBloc.updateSelectedImage(File(image.path));
    }
  }
}