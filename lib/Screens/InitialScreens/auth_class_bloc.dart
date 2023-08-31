import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_class_event.dart';

part 'auth_class_state.dart';

class AuthClassBloc extends Bloc<AuthClassEvent, AuthClassState> {
  AuthClassBloc() : super(AuthClassInitialChecking()) {
    on<AuthCheckingInitial>(loadSplashOrHomeScreen);
    on<SignInClickedEvent>(authNavigateLoginScreenState);
    on<SignUpClickedEvent>(authNavigateRegistrationScreenState);
  }

  Future<FutureOr<void>> loadSplashOrHomeScreen(
      AuthCheckingInitial event, Emitter<AuthClassState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getBool('email');
    if (email!) {
      print('loading home screen from the splash screen');
      emit(AuthNavigateHomeScreenState());
    } else {
      print('loading splashScreen from the splash screen');
      emit(AuthLoadSplashScreen());
    }
  }

  FutureOr<void> authNavigateLoginScreenState(
      SignInClickedEvent event, Emitter<AuthClassState> emit) {
    print('login Navigation Event Registered');
    emit(AuthNavigateLoginScreenState());
  }

  FutureOr<void> authNavigateRegistrationScreenState(
      SignUpClickedEvent event, Emitter<AuthClassState> emit) {
    print('Navigation Event Registered');
    emit(AuthNavigateRegisterationScreenState());
  }
}
