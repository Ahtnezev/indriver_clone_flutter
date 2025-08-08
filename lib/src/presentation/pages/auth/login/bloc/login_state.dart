
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class LoginState extends Equatable {
  // incluir siempre que tengamos un formulario en nuestra pantalla
  // nos permite controlar el formulario
  final BlogFormItem email;
  final BlogFormItem password;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = const BlogFormItem(error: 'Ingresa el email'), // 4:03 - 21.
    this.password = const BlogFormItem(error: 'Ingresa el password'),
    this.formKey
  });

  // lleva las mismas propiedades que el constructor
  LoginState copyWith({
    BlogFormItem? email,
    BlogFormItem? password,
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