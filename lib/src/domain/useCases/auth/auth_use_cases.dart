import 'package:indriver_clone_flutter/src/domain/useCases/auth/get_user_session_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/login_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/register_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/save_user_session_use_case.dart';

// add all auth uses cases
class AuthUseCases {

  LoginUseCase login;
  RegisterUseCase register;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;

  AuthUseCases({
    required this.login, required this.register,
    required this.saveUserSession, required this.getUserSession
  });

}