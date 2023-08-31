part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}
abstract class RegisterActionState extends RegisterState {}

class NavigateToLoginScreenActionState extends RegisterActionState{}

class FailedToRegisterState extends RegisterState{}

class SuccessRegisterActionState extends RegisterActionState{}

class RegisterInitial extends RegisterState {}
