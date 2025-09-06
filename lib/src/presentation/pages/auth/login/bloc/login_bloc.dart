import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  LoginBloc(this.authUseCases) : super(LoginState()) {

    on<LoginInitEvent>((event, emit) {
      //! desde aqui podremos cambiar el valor de las variables -> LoginState
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlogFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingresa el email' : null
            ),
          formKey: formKey
        )
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: BlogFormItem(
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
