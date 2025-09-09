

import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}


class NameChanged extends RegisterInitEvent {
  final BlogFormItem name;

  NameChanged({required this.name});
}

class LastnameChanged extends RegisterInitEvent {
  final BlogFormItem lastname;

  LastnameChanged({required this.lastname});
}

class EmailChanged extends RegisterInitEvent {
  final BlogFormItem email;

  EmailChanged({required this.email});
}

class PhoneChanged extends RegisterInitEvent {
  final BlogFormItem phone;

  PhoneChanged({required this.phone});
}

class PasswordChanged extends RegisterInitEvent {
  final BlogFormItem password;

  PasswordChanged({required this.password});
}

class PasswordConfirmChanged extends RegisterInitEvent {
  final BlogFormItem passwordConfirm;

  PasswordConfirmChanged({required this.passwordConfirm});
}

class SaveUserSession extends RegisterInitEvent {
  final AuthResponse authResponse;
  SaveUserSession({required this.authResponse});
}

class FormSubmit extends RegisterInitEvent {}
class FormReset extends RegisterInitEvent {}