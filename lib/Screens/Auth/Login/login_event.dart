part of 'login_bloc.dart';

abstract class LoginEvent {}

class InitialLogin extends LoginEvent {}

class SubmitForm extends LoginEvent {
  final String email;
  final String password;

  SubmitForm({required this.email, required this.password});
}

class ForgetPasswordClicked extends LoginEvent {}

class SignUpClicked extends LoginEvent {}
