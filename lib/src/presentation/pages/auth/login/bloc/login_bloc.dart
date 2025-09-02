import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/login_use_case.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase = LoginUseCase();

  LoginBloc() : super(LoginState()) {

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
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');

      // await Future.delayed(Duration(seconds: 2), () async {
      Resource response = await loginUseCase.run(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(response: Loading(), formKey: formKey));
    });
    // }); // remove in production


  }
}
