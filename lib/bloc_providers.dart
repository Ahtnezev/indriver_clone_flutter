

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/injection.dart';
import 'package:indriver_clone_flutter/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/users/users_use_cases.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/bloc/profile_info_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/bloc/profile_info_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/profile/info/update/bloc/profile_update_event.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create:
        (context) => LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create:
        (context) =>
            RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent()),
  ),
  BlocProvider<ClientHomeBloc>(
    create:
        (context) =>
            ClientHomeBloc(locator<AuthUseCases>()),
  ),
  BlocProvider<ProfileInfoBloc>(
    create:
        (context) =>
            ProfileInfoBloc(locator<AuthUseCases>())..add(GetUserInfo()),
  ),
  BlocProvider<ProfileUpdateBloc>(
    create: (context) => ProfileUpdateBloc(locator<UsersUseCases>()),
  ) 
];