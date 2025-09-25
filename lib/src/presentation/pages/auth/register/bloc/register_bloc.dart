import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    // practicamente inicializamos el estado (formulario)
    on<RegisterInitEvent>((event, emit) {
      // state. -> podemos acceder a las propiedades del estado (RegisterState)
      emit(state.copyWith(formKey: formKey));
    });

    on<SaveUserSession>((event, emit) async {
      await authUseCases.saveUserSession.run(event.authResponse);
    });

    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isEmpty ? 'Ingresa el nombre' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<LastnameChanged>((event, emit) {
      emit(
        state.copyWith(
          lastname: BlocFormItem(
            value: event.lastname.value,
            error: event.lastname.value.isEmpty ? 'Ingresa el apellido' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingresa el correo' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PhoneChanged>((event, emit) {
      emit(
        state.copyWith(
          phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isEmpty ? 'Ingresa el telefono' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isEmpty
              ? 'Ingresa el password'
              : event.password.value.length < 6
                ? 'Debe contener al menos 6 caracteres'
                : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordConfirmChanged>((event, emit) {
      emit(
        state.copyWith(
          passwordConfirm: BlocFormItem(
            value: event.passwordConfirm.value,
            error: event.passwordConfirm.value.isEmpty
              ? 'Confirma el password'
              : event.passwordConfirm.value.length < 6
                ? 'Debe contener al menos 6 caracteres'
                : event.passwordConfirm.value != state.password.value
                  ? 'Los password no coinciden'
                  : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmit>((event, emit) async {
      print('name: ${state.name.value}');
      print('lastname: ${state.lastname.value}');
      print('email: ${state.email.value}');
      print('phone: ${state.phone.value}');
      print('password: ${state.password.value}');
      print('confirmPassword: ${state.passwordConfirm.value}');

      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey, // keep the form state
        ),
      );
      Resource response = await authUseCases.register.run(state.toUser());
      emit(
        state.copyWith(
          response: response,
          formKey: formKey, // keep the form state
        ),
      );
    });

    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });

  }
}
