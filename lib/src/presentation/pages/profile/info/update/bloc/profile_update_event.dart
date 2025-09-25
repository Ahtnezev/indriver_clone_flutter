
import 'package:indriver_clone_flutter/src/domain/models/user.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

abstract class ProfileUpdateEvent {}

class ProfileUpdateInitEvent extends ProfileUpdateEvent { //check , in tutorial dont have a `extends`
  final User? user;

  ProfileUpdateInitEvent({required this.user});
}

class NameChanged extends ProfileUpdateEvent {
  final BlocFormItem name; 
  NameChanged({required this.name});
}

class LastnameChanged extends ProfileUpdateEvent {
  final BlocFormItem lastname; 
  LastnameChanged({required this.lastname});
}

class PhoneChanged extends ProfileUpdateEvent {
  final BlocFormItem phone; 
  PhoneChanged({required this.phone});
}

class FormSubmit extends ProfileUpdateEvent {}