

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class RegisterState extends Equatable {

  final BlogFormItem name;
  final BlogFormItem lastname;
  final BlogFormItem email;
  final BlogFormItem phone;
  final BlogFormItem password;
  final BlogFormItem passwordConfirm;
  final GlobalKey<FormState>? formKey;

  const RegisterState({
    this.name = const BlogFormItem(error: 'Ingresa el nombre'),
    this.lastname = const BlogFormItem(error: 'Ingresa el apellido'),
    this.email = const BlogFormItem(error: 'Ingresa el email'),
    this.phone = const BlogFormItem(error: 'Ingresa el telefono'),
    this.password = const BlogFormItem(error: 'Ingresa el password'),
    this.passwordConfirm = const BlogFormItem(error: 'Confirma el password'),
    this.formKey
  });

  RegisterState copyWith({
    BlogFormItem? name,
    BlogFormItem? lastname,
    BlogFormItem? email,
    BlogFormItem? phone,
    BlogFormItem? password,
    BlogFormItem? passwordConfirm,
    GlobalKey<FormState>? formKey,
  }) {
      return RegisterState(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        formKey: formKey,
      );
  }

  @override
  List<Object?> get props => [name, lastname, email, phone, password, passwordConfirm];


}