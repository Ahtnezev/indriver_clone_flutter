
import 'package:indriver_clone_flutter/src/domain/repository/auth_repository.dart';
// DI (dependency injection) avoid instances, access to code in any class


// UI 
// VIEW MODEL (in this case, our bloc)
// USE CASES
// REPOSITORY
// DATASOURCE

class LoginUseCase {
  // injectable (ID), avoid instances
  AuthRepository repository;
  LoginUseCase(this.repository);
  
  run(String email, String password) => repository.login(email, password);
}