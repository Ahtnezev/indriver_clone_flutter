
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/bloc/profile_info_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/bloc/profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {

  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases): super(ProfileInfoState()) {
    on<GetUserInfo>((event, emit) async {
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      // change texts when we receive the authresponse (state change)
      emit(
        state.copyWith(user: authResponse.user)
      );
    }); 
  }

}