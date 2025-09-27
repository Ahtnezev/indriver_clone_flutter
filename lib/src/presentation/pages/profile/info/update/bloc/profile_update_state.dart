
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/domain/utils/resource.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

class ProfileUpdateState extends Equatable {

  final int id;
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const ProfileUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.lastname = const BlocFormItem(error: 'Ingresa el apellido'),
    this.phone = const BlocFormItem(error: 'Ingresa el teléfono'),
    this.formKey,
    this.response
  });

  toUser() =>
      User(name: name.value, lastname: lastname.value, phone: phone.value);

  ProfileUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return ProfileUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [name, lastname, phone, response];

}