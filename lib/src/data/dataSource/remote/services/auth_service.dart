import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indriver_clone_flutter/src/data/api/api_config.dart';

class AuthService {

  Future<dynamic> login(String email, String password) async {
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
      print("Data Remote: $data");

      return data;
    } catch(e) {
      print("Error: $e");
    }
  }

}