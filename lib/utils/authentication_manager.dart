final class AuthenticationManager {
  static final AuthenticationManager _instance = AuthenticationManager._internal();

  factory AuthenticationManager() => _instance;

  AuthenticationManager._internal();

  String? _token;

  void setToken(String token) {
    _token = token;
  }

  String? get token => _token;

  void clearToken() {
    _token = null;
  }
}
