import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';

GoogleSignInAccount? googleUser;

Future<AuthResponse> signInWithGoogle() async {
  const webClientId =
      '70797426084-2rsrkmv93tjgot5f21r5oqs189lhogg2.apps.googleusercontent.com';

  final GoogleSignIn googleSignIn = GoogleSignIn(
    serverClientId: webClientId,
  );

  // تسجيل الدخول باستخدام Google
  googleUser = await googleSignIn.signIn();
  
  // التحقق مما إذا كان المستخدم قد اختار حسابًا أم لا
  if (googleUser == null) {
    throw Exception('User did not select a Google account.');
  }

  // الحصول على البيانات الخاصة بالمستخدم بعد التحقق
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw Exception('No Access Token found.');
  }
  if (idToken == null) {
    throw Exception('No ID Token found.');
  }

  // تسجيل الدخول إلى Supabase باستخدام بيانات Google
  final result = await getIt<SupabaseClient>().auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );

  // الحصول على بيانات المستخدم من Google
  final name = googleUser!.displayName ?? 'Unknown';
  final email = googleUser!.email;
  final image = googleUser!.photoUrl ?? '';

  // تخزين بيانات المستخدم باستخدام CacheHelper
  // getIt<CacheHelper>().saveUserModel(UserModel(
  //   name: name,
  //   email: email,
  //   image: image,
  // ));

  log('$name $email $image');
  return result;
}
