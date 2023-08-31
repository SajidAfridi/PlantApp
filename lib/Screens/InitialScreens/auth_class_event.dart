part of 'auth_class_bloc.dart';


abstract class AuthClassEvent {}

class AuthCheckingInitial extends AuthClassEvent {}

class LoadAuthScreenEvent extends AuthClassEvent {}

class SignInClickedEvent extends AuthClassEvent {}

class SignUpClickedEvent extends AuthClassEvent {}
