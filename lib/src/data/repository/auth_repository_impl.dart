
import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService = AuthService();

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

}