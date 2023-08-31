import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store_app/models/sqflite_helper.dart';
import 'package:plant_store_app/models/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialStateSuccessState()) {
    on<SubmitForm>(loginAuthenticationState);
    on<InitialLogin>(loginInitialState);
    on<SignUpClicked>(navigateToRegistrationScreenState);
    on<ForgetPasswordClicked>(navigateToForgotPasswordActionState);
  }

  Future<FutureOr<void>> loginAuthenticationState(
      SubmitForm event, Emitter<LoginState> emit) async {
    var temp = UserRepository(
        email: event.email,
        password: event.password,
    );
    var result = UserRepository(email: event.email,password: event.password,).authenticate(user: temp);
    if(await result){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.setBool('email', true);
      emit(LoginSuccessState());
    }
    else{
     emit(LoginFailedState());
    }
  }
  FutureOr<void> loginInitialState(
      InitialLogin event, Emitter<LoginState> emit) {
    PlantHelper plantHelper = PlantHelper();
    plantHelper.initializeDatabase();
    emit(LoginInitialStateSuccessState());
  }

  FutureOr<void>navigateToForgotPasswordActionState(
      ForgetPasswordClicked event, Emitter<LoginState> emit) {
    print('Navigate To Forgot Password State Registered');
    emit(NavigateToForgotPasswordActionState());
  }
  FutureOr<void>navigateToRegistrationScreenState(
      SignUpClicked event, Emitter<LoginState> emit) {
    print('Navigate To Registration State Registered');
    emit(NavigateToRegisterationScreenActionState());
  }
}
