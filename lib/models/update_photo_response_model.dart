final class UpdatePhotoResponseModel {
  UpdatePhotoResponseModel({
    this.photoUrl,
  });

  factory UpdatePhotoResponseModel.fromJson(Map<String, dynamic> json) => UpdatePhotoResponseModel(
    photoUrl: json['photoUrl'] is String ? json['photoUrl'] as String : null,
  );

  String? photoUrl;

  Map<String, dynamic> toJson() => {
    'photoUrl': photoUrl,
  };
}