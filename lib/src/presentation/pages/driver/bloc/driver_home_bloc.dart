

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/driver/bloc/driver_home_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/driver/bloc/driver_home_state.dart';

class DriverHomeBloc extends Bloc<DriverHomeEvent, DriverHomeState> {

  AuthUseCases authUseCases;

  DriverHomeBloc(this.authUseCases) : super(DriverHomeState()) {
    on<ChangeDrawerPage>((event, emit) {
      emit(
        state.copyWith(pageIndex: event.pageIndex)
      );
    }); 

    on<Logout>((event, emit) async {
      await authUseCases.logout.run();
    });
  }

}