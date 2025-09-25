import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  LoginBloc(this.authUseCases) : super(LoginState()) {

    on<LoginInitEvent>((event, emit) async {
      AuthResponse? authResponse = await authUseCases.getUserSession.run();
      print("Auth response session: ${authResponse?.toJson()}");
      //! desde aqui podremos cambiar el valor de las variables -> LoginState
      emit(state.copyWith(formKey: formKey));

      // that means: user logged and him information is stored in cache
      if (authResponse != null) {
        // notify state changes
        emit(state.copyWith(formKey: formKey, response: Success(authResponse)));
        // the redirect is on: login_page.dart file
      }
    });

    on<SaveUserSession>((event, emit) async {
      await authUseCases.saveUserSession.run(event.authResponse);
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingresa el email' : null
            ),
          formKey: formKey
        )
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isEmpty
            ? 'Ingresa el password'
            : event.password.value.length < 6
              ? 'El password debe tener al menos 6 caracteres'
                : null
        ),
        formKey: formKey,
      ));
    });

    on<FormSubmit>((event, emit) async {
      print('🐞 LoginBloc: Email: ${state.email.value}');
      print('🐞 LoginBloc: Password: ${state.password.value}');

      emit(state.copyWith(response: Loading(), formKey: formKey));

      // await Future.delayed(Duration(seconds: 2), () async { 
      Resource response = await authUseCases.login.run(
        state.email.value,
        state.password.value,
      );

      emit(state.copyWith(response: response, formKey: formKey));
    });
    // }); // remove in production


  }
}
