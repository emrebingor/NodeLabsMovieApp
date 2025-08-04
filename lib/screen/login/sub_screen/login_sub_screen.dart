part of '../login_screen.dart';

final class _LoginTypeRowWidget extends StatelessWidget {
  const _LoginTypeRowWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconBoxWidget(icon: ImagePathEnum.GOOGLE_ICON),
        const SizedBox(width: 8),
        IconBoxWidget(icon: ImagePathEnum.APPLE_ICON),
        const SizedBox(width: 8),
        IconBoxWidget(icon: ImagePathEnum.FACEBOOK_ICON),
      ],
    );
  }
}

final class _LoginRegisterInformationTextWidget extends StatelessWidget {
  const _LoginRegisterInformationTextWidget({this.onTap, required this.text, required this.subText});
  final VoidCallback? onTap;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [

          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w400,
            ),
          ),

          TextSpan(
            text: subText,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              onTap?.call();
            },
          ),
        ],
      ),
    );
  }
}

final class _RegisterInformationTextWidget extends StatelessWidget {
  const _RegisterInformationTextWidget();

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}

final class _ForgotPasswordTextWidget extends StatelessWidget {
  const _ForgotPasswordTextWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Şifremi unuttum',
        style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
          decorationThickness: 2,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}