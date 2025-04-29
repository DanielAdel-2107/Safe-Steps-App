import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:safe_steps/core/network/supabase/auth/sign_in_with_password.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //! sign up
  signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        await signInWithPassword(
            email: emailController.text, password: passwordController.text);
        emit(SignInSuccess());
      } on Exception catch (e) {
        emit(
          SignInFailure(message: e.toString()),
        );
      }
    }
  }
}
