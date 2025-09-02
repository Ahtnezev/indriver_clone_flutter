import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indriver_clone_flutter/src/data/api/api_config.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/utils/list_to_string.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';

class AuthService {

  Future<Resource<AuthResponse>> login(String email, String password) async {
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print("Data Remote: ${authResponse.toJson()}");
        print("Token: ${authResponse.token}");

        return Success(authResponse);
      } else {
        return ErrorData(listToString(data['message']));
      }

    } catch(e) {
      print("Error: $e");
      return ErrorData(e.toString());
    }
  }

}