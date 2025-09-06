import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indriver_clone_flutter/src/data/repository/auth_repository_impl.dart';
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/login_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/register_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  // to use in everywhere class
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
  );
  // we need to rebuild injectable file: injection.config.dart
  // command: flutter packages pub run build_runner build
}