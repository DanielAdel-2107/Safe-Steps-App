import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:safe_steps/app/my_app.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';
import 'package:safe_steps/core/local_notifications/local_notifications_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationsServices.init();
  await Supabase.initialize(
    url: "https://asgazagntpwuzuaefmpa.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFzZ2F6YWdudHB3dXp1YWVmbXBhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUwMjIzNzYsImV4cCI6MjA2MDU5ODM3Nn0.rXMMvOmXEsj4XRSgPs99AYaDlOnU4L1Cx-8VweGpsI8",
  );
  setupDI();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}
