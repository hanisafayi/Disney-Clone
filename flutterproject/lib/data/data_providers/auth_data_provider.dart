import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants.dart';

class AuthDataProvider {
  String? _token;
  final String _baseUrl = apiBaseUrl;

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      _token = response.body;
      return _token!;
    } else {
      throw Exception('Invalid credentials: Login failed');
    }
  }

  Future<String> signup(String username, String email, String password,
      String confirmPassword) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/signup'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final token = response.body;
      _token = token;
      return token;
    } else {
      throw Exception('Registration failed. Try again.');
    }
  }
}
