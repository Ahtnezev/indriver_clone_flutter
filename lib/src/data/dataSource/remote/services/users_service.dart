
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/data/api/api_config.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/domain/utils/list_to_string.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<String> token;

  UsersService(this.token);

  Future<Resource<User>> update(int id, User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/users/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      // properties must be the same with user.entity.ts file (backend)
      String body = json.encode({
        'name': user.name,
        'lastname': user.lastname,
        'phone': user.phone
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      // user update
      if (response.statusCode == 200 || response.statusCode == 201) {
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      } else {
        return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      debugPrint("Error service: $e");
      return ErrorData(e.toString());
    }
  }

}