import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthRemoteDataSource {
  final String baseUrl = 'http://192.168.0.101:5000/auth';

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    final data = jsonDecode(response.body);

    print("LOGIN RESPONSE: $data");

    return UserModel.fromJson({
      ...data['user'],
      "token": data['token'],
    });
  }

  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );



    final data = jsonDecode(response.body);

    print(response.body);

    return UserModel.fromJson(data['user']);
  }
}
