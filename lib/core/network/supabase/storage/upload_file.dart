import 'dart:developer';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';

Future<String> uploadFileToSupabaseStorage({required File file}) async {
  try {
    String fileName = "images/${Uuid().v4()}.jpg";
    await getIt<SupabaseClient>().storage.from('images').upload(fileName, file);
    return getIt<SupabaseClient>()
        .storage
        .from('images')
        .getPublicUrl(fileName);
  } on Exception catch (e) {
    log(e.toString());
  }
  return "";
}
