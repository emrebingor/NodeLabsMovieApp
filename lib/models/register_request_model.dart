final class RegisterRequestModel {
  RegisterRequestModel({
    this.email,
    this.name,
    this.password,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
    email: json['email'] is String ? json['email'] as String : null,
    name: json['name'] is String ? json['name'] as String : null,
    password: json['password'] is String ? json['password'] as String : null,
  );

  String? email;
  String? name;
  String? password;

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'password': password,
  };
}