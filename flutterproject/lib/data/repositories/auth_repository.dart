import '../data_providers/auth_data_provider.dart';

class AuthRepository {
  final AuthDataProvider _authDataProvider;

  AuthRepository(this._authDataProvider);

  Future<String> login(String email, String password) async {
    return await _authDataProvider.login(email, password);
  }

  Future<String> signup(String username, String email, String password,
      String confirmPassword) async {
    return await _authDataProvider.signup(
        username, email, password, confirmPassword);
  }
}
