

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/injection.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_event.dart';

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
];