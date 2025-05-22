import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:safe_steps/core/cache/cache_helper.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';
import 'package:safe_steps/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:safe_steps/features/auth/sign%20in/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
        await saveUserData();
        emit(SignInSuccess());
      } on Exception catch (e) {
        emit(
          SignInFailure(message: e.toString()),
        );
      }
    }
  }

  //!
  UserModel? userModel;
  saveUserData() async {
    var response = await getIt<SupabaseClient>()
        .from('users')
        .select()
        .eq("id", getIt<SupabaseClient>().auth.currentUser!.id)
        .single();
    userModel = UserModel.fromJson(response);
    getIt<CacheHelper>().saveUserModel(userModel!);
  }
}
