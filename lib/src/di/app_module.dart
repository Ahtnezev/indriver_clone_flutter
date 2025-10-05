import 'package:indriver_clone_flutter/src/data/dataSource/local/sharefpref.dart';
import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/users_service.dart';
import 'package:indriver_clone_flutter/src/data/repository/auth_repository_impl.dart';
import 'package:indriver_clone_flutter/src/data/repository/geolocator_repository_impl.dart';
import 'package:indriver_clone_flutter/src/data/repository/users_repository_impl.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';
import 'package:indriver_clone_flutter/src/domain/repository/geolocator_repository.dart';
import 'package:indriver_clone_flutter/src/domain/repository/users_repository.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/get_user_session_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/login_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/logout_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/register_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/save_user_session_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/geolocator/find_position_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/geolocator/geolocator_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/users/update_user_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/users/users_use_cases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @injectable
  SharefPref get sharefPref => SharefPref();

  @injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharefPref.read(
      'user',
    ); // 'user' comes from AuthRepositoryImpl file
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }

    return token;
  }

  // to use in everywhere class
  @injectable
  AuthService get authService => AuthService();
  
  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService,sharefPref);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  @injectable
  GeolocatorRepository get geolocatorRepository => GeolocatorRepositoryImpl();

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository)
  );

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(update: UpdateUserUseCase(usersRepository));

  @injectable
  GeolocatorUseCases get geolocatorUseCases => GeolocatorUseCases(
    findPosition: FindPositionUseCase(geolocatorRepository),
  );

  // we need to rebuild injectable file: injection.config.dart
  // command: flutter packages pub run build_runner build 
}