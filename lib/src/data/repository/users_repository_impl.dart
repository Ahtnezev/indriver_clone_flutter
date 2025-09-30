
import 'dart:io';

import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/users_service.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/domain/repository/users_repository.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersService usersService;

  UsersRepositoryImpl(this.usersService);

  @override
  Future<Resource<User>> update(int id, User user, File? file) {
    // user need to update information without image
    if (file == null) {
      return usersService.update(id, user);
    } else {
      return usersService.updateWithImage(id, user, file);
    }
    
  }



}