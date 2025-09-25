
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class ProfileUpdateState extends Equatable {

  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  ProfileUpdateState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.lastname = const BlocFormItem(error: 'Ingresa el apellido'),
    this.phone = const BlocFormItem(error: 'Ingresa el teléfono'),
    this.formKey,
  });

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(name: name ?? this.name, lastname: lastname ?? this.lastname, phone: phone ?? this.phone, formKey: formKey);
  }

  List<Object?> get props => [name, lastname, phone];

}