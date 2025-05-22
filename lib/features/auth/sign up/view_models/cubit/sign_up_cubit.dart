import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';
import 'package:safe_steps/core/network/supabase/auth/sign_up_with_password.dart';
import 'package:safe_steps/core/network/supabase/database/add_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //! sign up
  signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignUpLoading());
        await signUpWithPassword(
            email: emailController.text, password: passwordController.text);
        await addData(tableName: "users", data: {
          "id": getIt<SupabaseClient>().auth.currentUser!.id,
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneNumberController.text
        });
        emit(SignUpSuccess());
      } on Exception catch (e) {
        emit(
          SignUpFailure(message: e.toString()),
        );
      }
    }
  }
}
