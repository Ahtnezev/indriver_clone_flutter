import 'package:indriver_clone_flutter/src/domain/useCases/auth/login_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/register_use_case.dart';

// add all auth uses cases
class AuthUseCases {

  LoginUseCase login;
  RegisterUseCase register;

  AuthUseCases({
    required this.login, required this.register
  });

}