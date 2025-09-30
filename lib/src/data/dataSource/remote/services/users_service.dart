
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:indriver_clone_flutter/src/data/api/api_config.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/domain/utils/list_to_string.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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

  Future<Resource<User>> updateWithImage(int id, User user, File file) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/users/upload/$id');
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization: '] = await token;
      // 'file' is the indicator from backend
      request.files.add(
        http.MultipartFile(
          'file',
          http.ByteStream(file.openRead()).cast(),
          await file.length(),
          filename: basename(file.path),
          contentType: MediaType('image', 'jpg'),
        ),
      );
      // ['<n>'] form backend
      request.fields['name'] = user.name;
      request.fields['lastname'] = user.lastname;
      request.fields['phone'] = user.phone;
      final response = await request.send();
      final data = json.decode(
        await response.stream.transform(utf8.decoder).first,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        User userResponse = User.fromJson(data);
        return Success(data);
      } else {
        return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      debugPrint("Error: $e");
      return ErrorData(e.toString());
    }
  }

}