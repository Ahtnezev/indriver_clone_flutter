

import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';

class LogoutUseCase {
  AuthRepository authRepository;

  LogoutUseCase(this.authRepository);

  run() => authRepository.logout();
}