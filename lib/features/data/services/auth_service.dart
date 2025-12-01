import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:live_tracking/core/constants/api_constants.dart';
import 'package:live_tracking/features/data/models/sign_in_response.dart';
import '../models/signup_response_model.dart';

class AuthService {
  final http.Client client;

  AuthService({http.Client? client}) : client = client ?? http.Client();

  /// SIGNUP
  Future<SignupResponseModel> signup({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}api/user/register');

    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decoded = jsonDecode(response.body);
      return SignupResponseModel.fromJson(decoded);
    } else {
      throw Exception('Failed to signup: ${response.body}');
    }
  }

  /// LOGIN
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}api/user/login');

    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return LoginResponseModel.fromJson(decoded);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  // Existing login & signup methods ...
  Future<void> logoutbutton(String token) async {
  final url = Uri.parse('${ApiConstants.baseUrl}api/user/logout');

  final response = await client.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode != 200) {
    throw Exception('Logout failed: ${response.body}');
  }
}

}
