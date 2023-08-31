import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_store_app/models/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<InitialRegisterEvent>(registerInitialState);
    on<SubmitFormEvent>(submitFormEvent);
  }
    FutureOr<void> registerInitialState(InitialRegisterEvent event, Emitter<RegisterState>emit){
      emit(RegisterInitial());
    }
    Future<FutureOr<void>> submitFormEvent(SubmitFormEvent event, Emitter<RegisterState>emit ) async {
      var temp = UserRepository(
        email: event.email,
        password: event.password
      );
      var result = await UserRepository(email:temp.email,password:temp.password).registerUser(user: temp);
      if(result){
        emit(SuccessRegisterActionState());
      }
      else{
        emit(FailedToRegisterState());
      }
    }
  }
