
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  // incluir siempre que tengamos un formulario en nuestra pantalla
  // nos permite controlar el formulario
  final String email;
  final String password;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = '',
    this.password = '',
    this.formKey
  });

  // lleva las mismas propiedades que el constructor
  LoginState copyWith({
    String? email,
    String? password,
    GlobalKey<FormState>? formKey
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, password];


}