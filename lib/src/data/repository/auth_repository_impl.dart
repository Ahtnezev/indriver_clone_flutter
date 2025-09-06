
import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  // DI. Dependency Injection >.<
  AuthService authService;
  AuthRepositoryImpl(this.authService);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

}