

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/roles/bloc/roles_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/roles/bloc/roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  AuthUseCases authUseCases;

  RolesBloc(this.authUseCases) : super(const RolesState()) {
    on<RolesEvent>((event, emit) async{
        AuthResponse? authResponse = await authUseCases.getUserSession.run();
        emit(
          state.copyWith(
            roles: authResponse?.user.roles
          )
        );
    });   
  }

}