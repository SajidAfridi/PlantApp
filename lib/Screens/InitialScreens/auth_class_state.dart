part of 'auth_class_bloc.dart';

abstract class AuthClassState {}
abstract class AuthActionState extends AuthClassState {}

class AuthClassInitialChecking extends AuthClassState {}
class AuthLoadSplashScreen extends AuthClassState{}
class AuthNavigateLoginScreenState extends AuthActionState{}
class AuthNavigateRegisterationScreenState extends AuthActionState{}
class AuthNavigateHomeScreenState extends AuthActionState{}

