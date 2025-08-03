import 'package:node_labs_movie_app/enum/image_path_enum.dart';
import 'package:node_labs_movie_app/utils/extension/string_extension.dart';

extension ImagePathEnumExtension on ImagePathEnum {
  String get getImagePath {
    const String _baseImagePath = 'assets/';
    const String _svgPath = 'svg/';
    const String _pngPath = 'png/';
    String _imagePath = '';

    switch (this) {
      case ImagePathEnum.GOOGLE_ICON:
        _imagePath = _baseImagePath + _svgPath + 'ic_google'.toSvg;
        break;
      case ImagePathEnum.APPLE_ICON:
        _imagePath = _baseImagePath + _svgPath + 'ic_apple'.toSvg;
        break;
      case ImagePathEnum.FACEBOOK_ICON:
        _imagePath = _baseImagePath + _svgPath + 'ic_facebook'.toSvg;
        break;
      case ImagePathEnum.MAIL:
        _imagePath = _baseImagePath + _svgPath + 'ic_mail'.toSvg;
        break;
      case ImagePathEnum.PASSWORD:
        _imagePath = _baseImagePath + _svgPath + 'ic_password'.toSvg;
        break;
      case ImagePathEnum.VISIBLE:
        _imagePath = _baseImagePath + _svgPath + 'ic_visible'.toSvg;
        break;
      case ImagePathEnum.NAME:
        _imagePath = _baseImagePath + _svgPath + 'ic_name'.toSvg;
        break;
      case ImagePathEnum.HOME:
        _imagePath = _baseImagePath + _svgPath + 'ic_home'.toSvg;
        break;
      case ImagePathEnum.PROFILE:
        _imagePath = _baseImagePath + _svgPath + 'ic_profile'.toSvg;
        break;
    }
    return _imagePath;
  }
}