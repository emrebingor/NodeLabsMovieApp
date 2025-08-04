import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:io';

final class CompressImageHelper {
  Future<File> compressImage(File file) async {
    final targetPath = '${file.parent.path}/compressed_${file.path.split('/').last}';

    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70,
      format: CompressFormat.jpeg,
    );

    if (result == null) {
      print('Return back if it fails.');
      return file;
    }

    return File(result.path);
  }
}