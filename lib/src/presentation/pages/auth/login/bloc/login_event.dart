
import 'package:indriver_clone_flutter/src/domain/models/auth_response.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/blog_form_item.dart';

abstract class LoginEvent {}

// solo inicializa el formulario
class LoginInitEvent extends LoginEvent {}

// capturar cambios en los campos 
class EmailChanged extends LoginEvent{
  final BlocFormItem email;
  EmailChanged({required this.email });
}

class PasswordChanged extends LoginEvent{
  final BlocFormItem password;
  PasswordChanged({required this.password });
}

class SaveUserSession extends LoginEvent {
  final AuthResponse authResponse;
  SaveUserSession({required this.authResponse});
}

// 
class FormSubmit extends LoginEvent {}