

import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';

class SaveUserSessionUseCase {
  AuthRepository authRepository;

  SaveUserSessionUseCase(this.authRepository);

  run(AuthResponse authResponse) => authRepository.saveUserSession(authResponse);

}