
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
     try {
       final email= event.email;
      final password = event.password;
      final RegExp regex =RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if(password.length < 6){
        emit(AuthFailure(error: 'password must be of atleast 7 length'));
        return;
      }
      if(email.isEmpty || !regex.hasMatch(email)){
        emit(AuthFailure(error: 'email should not be empty or invalid email'));
        return;
      }
      else{
         await Future.delayed(Duration(seconds: 1));{
          return emit(AuthSuccess(uid:'$email-$password'));
         }
      }
       
     } catch (e) {
       return emit(AuthFailure(error: e.toString()));
     }
      
    },
    );
    on<AuthLogout>((event,emit){
      emit(AuthLoading());
      try {
        emit(AuthInitial());
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
   }) ;
    
  }
}
