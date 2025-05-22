import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:safe_steps/core/cache/cache_helper.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';
import 'package:safe_steps/core/helper/pick_image.dart';
import 'package:safe_steps/core/network/supabase/database/add_data.dart';
import 'package:safe_steps/core/network/supabase/storage/upload_file.dart';
import 'package:safe_steps/features/auth/sign%20in/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial()) {
    userModel = getIt<CacheHelper>().getUserModel()!;
    nameController = TextEditingController(text: userModel.name);
    emailController = TextEditingController(text: userModel.email);
    imageUrl = userModel.image;
  }

  late UserModel userModel;
  late TextEditingController nameController;
  late TextEditingController emailController;
  String? imageUrl;
  File? imageFile; //
  pickImage() async {
    try {
      emit(UploadImageLoading());
      await pickAndUploadImages().then((value) => imageFile = value);
      emit(UploadImageSuccess());
    } on Exception catch (e) {
      emit(UploadImageFailure(errorMessage: e.toString()));
    }
  }

  updateProfiele() async {
    if (nameController.text != userModel.name ||
        imageFile != null ||
        emailController.text != userModel.email) {
      try {
        emit(EditProfileLoading());
        await addData(
          tableName: "users",
          data: {
            "name": nameController.text,
            "email": emailController.text,
            if (imageFile != null)
              "image":await uploadFileToSupabaseStorage(file: imageFile!),
          },
        );
        await refreshUserData();
        emit(EditProfileSuccess());
      } on Exception catch (e) {
        emit(EditProfileFailure(errorMessage: e.toString()));
      }
    }else{
      emit(NoChangesMade());
    }
  }

  refreshUserData() async {
    var response = await getIt<SupabaseClient>()
        .from('users')
        .select()
        .eq("id", getIt<SupabaseClient>().auth.currentUser!.id)
        .single();
    getIt<CacheHelper>().saveUserModel(UserModel.fromJson(response));
    userModel = getIt.get<CacheHelper>().getUserModel()!;
    nameController.text = userModel.name;
    emailController.text = userModel.email;
    imageUrl = userModel.image;
    imageFile = null;
  }
}
