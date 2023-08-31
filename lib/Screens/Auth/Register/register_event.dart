part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class InitialRegisterEvent extends RegisterEvent{}
class SubmitFormEvent extends RegisterEvent{
  final String email;
  final String password;

  SubmitFormEvent({required this.email, required this.password});

}
