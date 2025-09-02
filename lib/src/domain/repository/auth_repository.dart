
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String email, String password);
}