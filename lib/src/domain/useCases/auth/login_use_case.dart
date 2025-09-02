
import 'package:indriver_clone_flutter/src/data/repository/auth_repository_impl.dart';
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';

// UI 
// VIEW MODEL (in this case, our bloc)
// USE CASES
// REPOSITORY
// DATASOURCE

class LoginUseCase {
  AuthRepository repository = AuthRepositoryImpl();
  
  run(String email, String password) => repository.login(email, password);
}