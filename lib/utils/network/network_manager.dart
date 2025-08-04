import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://caseapi.servicelabs.tech',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  static final NetworkManager _instance = NetworkManager._internal();
  late final Dio _dio;

  factory NetworkManager() {
    return _instance;
  }

  String? _authToken;

  void setAuthToken(String token) {
    _authToken = token;
  }

  Map<String, dynamic> _buildHeaders([Map<String, dynamic>? headers]) {
    final combinedHeaders = <String, dynamic>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_authToken',
    };

    if (headers != null) {
      headers.remove('Authorization');
      combinedHeaders.addAll(headers);
    }

    return combinedHeaders;
  }

  Future<Response> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: _buildHeaders(headers)),
      );
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  Future<Response> post(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        options: Options(headers: _buildHeaders(headers)),
      );
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      return 'Error ${error.response?.statusCode}: ${error.response?.data}';
    } else {
      return 'Connection error: ${error.message}';
    }
  }
}
