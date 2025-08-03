final class AddFavoriteResponseModel {
  AddFavoriteResponseModel({
    this.success,
    this.message,
  });

  factory AddFavoriteResponseModel.fromJson(Map<String, dynamic> json) => AddFavoriteResponseModel(
    success: json['success'] is bool ? json['success'] as bool : null,
    message: json['message'] is String ? json['message'] as String : null,
  );

  bool? success;
  String? message;

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
  };
}