
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class LoginState extends Equatable {
  // incluir siempre que tengamos un formulario en nuestra pantalla
  // nos permite controlar el formulario
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const LoginState({
    this.email = const BlocFormItem(error: 'Ingresa el email'), // 4:03 - 21.
    this.password = const BlocFormItem(error: 'Ingresa el password'),
    this.formKey,
    this.response
  });

  // lleva las mismas propiedades que el constructor
  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [email, password, response];


}