import 'package:node_labs_movie_app/components/boxes/icon_box_widget.dart';
import 'package:node_labs_movie_app/components/buttons/button_widget.dart';
import 'package:node_labs_movie_app/components/text_fields/email_text_field_widget.dart';
import 'package:node_labs_movie_app/components/text_fields/password_text_field_widget.dart';
import 'package:node_labs_movie_app/components/text_fields/text_field_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/description_text_widget.dart';
import 'package:node_labs_movie_app/components/text_widgets/title_text_widget.dart';
import 'package:node_labs_movie_app/components/boxes/icon_box_widget.dart';
import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 39),
            child: Column(
              children: [
                TitleTextWidget(
                  text: 'Merhabalar',
                ),
                DescriptionTextWidget(
                  text: "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
                ),

                const SizedBox(height: 40),

                TextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Ad Soyad',
                ),

                const SizedBox(height: 14),

                EmailTextFieldWidget(controller: TextEditingController()),

                const SizedBox(height: 14),

                PasswordTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Şifre',
                  obscureText: true,
                  visibleOnTap: () {},
                ),

               const SizedBox(height: 14),

                PasswordTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Şifre Tekrar',
                  obscureText: true,
                  visibleOnTap: () {},
                ),

                const SizedBox(height: 30),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Kullanıcı sözleşmesini ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'okudum ve kabul ediyorum.',
                        style: const TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                        },
                      ),
                      TextSpan(
                        text: ' Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                ButtonWidget(
                  onTap: () {
                  },
                  title: 'Giriş Yap',
                ),

                const SizedBox(height: 37),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconBoxWidget(icon: ImagePathEnum.GOOGLE_ICON),
                    const SizedBox(width: 8),
                    IconBoxWidget(icon: ImagePathEnum.APPLE_ICON),
                    const SizedBox(width: 8),
                    IconBoxWidget(icon: ImagePathEnum.FACEBOOK_ICON),
                  ],
                ),

                const SizedBox(height: 32),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Bir hesabın yok mu? ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' Kayıt Ol!',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
