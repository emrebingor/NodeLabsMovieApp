import 'dart:io';
import 'package:node_labs_movie_app/components/app_bar/app_bar_widget.dart';
import 'package:node_labs_movie_app/components/buttons/button_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/description_text_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/title_text_widget.dart';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/base/view/base_view.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_event.dart';
import 'package:node_labs_movie_app/data/bloc/profile_detail/profile_detail_state.dart';
import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/screen/profile_detail/mixin/profile_detail_screen_mixin.dart';
import 'package:node_labs_movie_app/utils/extension/image_path_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

part './sub_screen/profile_detail_sub_screen.dart';

final class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

final class _ProfileDetailScreenState extends BaseViewState<ProfileDetailScreen> with ProfileDetailScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileDetailBloc, ProfileDetailAction, ProfileDetailState>(
      blocModel: profileDetailBloc,
      child: BlocConsumer<ProfileDetailBloc, ProfileDetailState>(
        listener: listener,
        builder: (BuildContext context, ProfileDetailState state) {
          return Scaffold(
            appBar: AppBarWidget(title: 'Profil Detayı'),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    TitleTextWidget(text: "Fotoğraflarınızı Yükleyin"),

                    const SizedBox(height: 8),

                    DescriptionTextWidget(text: "Resources out incentivize\n relaxation floor loss cc."),

                    const SizedBox(height: 48),

                    _ImageBoxWidget(
                      selectedImage: state.selectedImage,
                      onTap: pickImage,
                    ),

                    Spacer(),

                    ButtonWidget(
                      onTap: () {
                        updateSelectedPhoto();
                      },
                      title: 'Devam Et',
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
