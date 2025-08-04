import 'package:node_labs_movie_app/components/boxes/icon_box_widget.dart';
import 'package:node_labs_movie_app/components/buttons/button_widget.dart';
import 'package:node_labs_movie_app/components/text_fields/email_text_field_widget.dart';
import 'package:node_labs_movie_app/components/text_fields/password_text_field_widget.dart';
import 'package:node_labs_movie_app/components/text_fields/text_field_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/description_text_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/title_text_widget.dart';
import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/core/base/state/base_view_state.dart';
import 'package:node_labs_movie_app/core/base/view/base_view.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_bloc.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_event.dart';
import 'package:node_labs_movie_app/data/bloc/login/login_state.dart';
import 'package:node_labs_movie_app/screen/login/mixin/login_screen_mixin.dart';
import 'package:node_labs_movie_app/utils/extension/widget_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

part './sub_screen/login_sub_screen.dart';

final class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final class _LoginScreenState extends BaseViewState<LoginScreen> with LoginScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginBloc, LoginAction, LoginState>(
      blocModel: loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: listener,
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39),
                  child: Column(
                    children: [

                      TitleTextWidget(
                        text: state.isRegister ? 'Hoşgeldiniz' : 'Merhabalar',
                      ),

                      DescriptionTextWidget(
                        text: "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
                      ),

                      const SizedBox(height: 40),

                      state.isRegister ? TextFieldWidget(
                        controller: fullNameController,
                        hintText: 'Ad Soyad',
                      ) : SizedBox.shrink(),

                      state.isRegister ? const SizedBox(height: 14) : SizedBox.shrink(),

                      EmailTextFieldWidget(controller: mailController),

                      const SizedBox(height: 14),

                      PasswordTextFieldWidget(
                        controller: passwordController,
                        hintText: 'Şifre',
                        obscureText: state.obscureText,
                        visibleOnTap: updateObscureTextStatus,
                      ),

                      state.isRegister ? const SizedBox(height: 14) : SizedBox.shrink(),

                      state.isRegister ? PasswordTextFieldWidget(
                        controller: secondPasswordController,
                        hintText: 'Şifre Tekrar',
                        obscureText: state.obscureText,
                        visibleOnTap: updateObscureTextStatus,
                      ) : SizedBox.shrink(),

                      const SizedBox(height: 30),

                      state.isRegister ? _RegisterInformationTextWidget()
                          : _ForgotPasswordTextWidget(),

                      const SizedBox(height: 24),

                      ButtonWidget(
                        onTap: state.isRegister ? registerUser : loginUser,
                        title: state.isRegister ? 'Şimdi Kaydol' : 'Giriş Yap',
                      ),

                      const SizedBox(height: 37),

                      _LoginTypeRowWidget(),

                      const SizedBox(height: 32),

                      _LoginRegisterInformationTextWidget(
                        onTap: updateRegisterStatus,
                        text: state.isRegister ? 'Zaten bir hesabın var mı?' : 'Bir hesabın yok mu? ',
                        subText: state.isRegister ? ' Giriş Yap!' : ' Kayıt Ol!',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ).withLoading(state.isLoading);
        },
      ),
    );
  }
}