final class UserResponseModel {
  UserResponseModel({
    this.response,
    this.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
    response: json['response'] is String ? json['response'] as String : null,
    data: json['data'] is Map<String, dynamic> ? User.fromJson(json['data'] as Map<String, dynamic>) : null,
  );

  String? response;
  User? data;

  Map<String, dynamic> toJson() => {
    'response': response,
    'data': data,
  };
}

final class User {
  String? id;
  String? name;
  String? email;
  String? photoUrl;
  String? token;

  User({
    this.email,
    this.id,
    this.name,
    this.token,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    id: json['id'],
    email: json['email'],
    token: json['token'],
    photoUrl: json['photoUrl'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'email': email,
    'token': token,
    'photoUrl': photoUrl,
  };
}