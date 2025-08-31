import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indriver_clone_flutter/src/data/api/api_config.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';

class AuthService {

  Future<AuthResponse?> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/login');
      // print("URL: $url");
      Map<String, String> headers = { 'Content-Type': 'application/json' };
      String body = json.encode({
        'email': email,
        'password': password
      });
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(data);

      print("Data Remote: ${authResponse.toJson()}");
      print("Token: ${authResponse.token}");


      return authResponse;
    } catch(e) {
      print("Error: $e");
      return null;
    }
  }

}