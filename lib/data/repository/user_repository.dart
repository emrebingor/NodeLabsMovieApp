import 'package:dio/dio.dart';
import 'dart:io';
import 'package:node_labs_movie_app/models/register_response_model.dart';
import 'package:node_labs_movie_app/models/update_photo_response_model.dart';
import 'package:node_labs_movie_app/utils/network/network_manager.dart';
import 'package:node_labs_movie_app/utils/helper/compress_image_helper.dart';
import 'package:http_parser/http_parser.dart';


final class UserRepository {
  final NetworkManager _networkManager = NetworkManager();

  Future<UserResponseModel> getUser() async {
    try {
      final Response response = await _networkManager.get(
        '/user/profile',
      );

      if (response.statusCode == 200 && response.data != null) {
        return UserResponseModel.fromJson(response.data);
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdatePhotoResponseModel> updatePhoto({
    required File image,
  }) async {
    try {
      final compressed = await CompressImageHelper().compressImage(image);

      final fileName = compressed.path.split('/').last;

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          compressed.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      final response = await _networkManager.post(
        '/user/upload_photo',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        return UpdatePhotoResponseModel.fromJson(response.data);
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      print('Upload error: $e');
      rethrow;
    }
  }
}