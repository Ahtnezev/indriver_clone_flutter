
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';

// dominio: definicion de la logica, metodos o funciones que vamos a usar mas adelante
abstract class AuthRepository {

  Future<Resource<AuthResponse>> login(String email, String password);

  Future<Resource<AuthResponse>> register(User user);


}