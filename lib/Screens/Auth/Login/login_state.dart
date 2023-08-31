part of 'login_bloc.dart';

abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginInitialStateSuccessState extends LoginActionState {}

class NavigateToForgotPasswordActionState extends LoginActionState {}

class NavigateToRegisterationScreenActionState extends LoginActionState {}

class LoginInitialState extends LoginState {}

class LoginSubmissionState extends LoginState {}

class LoginAuthenticatingState extends LoginState {}

class LoginSuccessState extends LoginActionState {}

class LoginFailedState extends LoginActionState {}
