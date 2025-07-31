
abstract class LoginEvent {}

// solo inicializa el formulario
class LoginInitEvent extends LoginEvent {}

// capturar cambios en los campos 
class EmailChanged extends LoginEvent{
  final String email;
  EmailChanged({required this.email });
}

class PasswordChanged extends LoginEvent{
  final String password;
  PasswordChanged({required this.password });
}

// 
class FormSubmit extends LoginEvent {}