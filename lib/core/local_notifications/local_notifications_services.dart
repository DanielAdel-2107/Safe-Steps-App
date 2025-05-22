import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationsServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final StreamController<NotificationResponse> streamController =
      StreamController<NotificationResponse>.broadcast();

  static void onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  // Initialize notifications
  static Future<void> init() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );

    // Create notification channel for Android
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'hydration_channel',
      'Hydration Reminders',
      description: 'Reminders to drink water',
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Request notification permission
  static Future<bool> requestNotificationPermission() async {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    bool? isGranted =
        await androidImplementation?.requestNotificationsPermission();
    if (isGranted == null || !isGranted) {
      isGranted = await androidImplementation?.requestNotificationsPermission();
    }
    return isGranted ?? false;
  }

  // Request exact alarm permission (Android 12+)
  static Future<bool> requestExactAlarmPermission() async {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    bool? isGranted =
        await androidImplementation?.requestExactAlarmsPermission();
    return isGranted ?? false;
  }

  // Cancel all notifications
  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> scheduleNotificationsByInterval({
    required String title,
    required String body,
    required int timesPerDay,
    int baseId = 1000,
  }) async {
    await init();

    // Check permissions
    final bool hasNotificationPermission =
        await requestNotificationPermission();
    final bool hasExactAlarmPermission = await requestExactAlarmPermission();
    if (!hasNotificationPermission || !hasExactAlarmPermission) {
      debugPrint('Permissions not granted');
      return;
    }

    // Initialize timezone
    tz.initializeTimeZones(); // Note: Use singular initializeTimeZone
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // Cancel existing notifications
    await cancelAllNotifications();

    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'med_channel',
        'Medicine Reminders',
        channelDescription: 'Reminders to take your medicine',
        importance: Importance.max,
        priority: Priority.high,
        visibility: NotificationVisibility.public,
      ),
    );

    final now = tz.TZDateTime.now(tz.local);
    final intervalMinutes = (24 * 60) ~/ timesPerDay;

    for (int i = 0; i < timesPerDay; i++) {
      tz.TZDateTime scheduledTime;
      if (i == 0) {
        // First notification: Schedule 5 seconds from now
        scheduledTime = now.add(const Duration(seconds: 5));
      } else {
        // Subsequent notifications: Space evenly
        scheduledTime = now.add(Duration(minutes: intervalMinutes * i));
      }

      // Ensure the scheduled time is in the future
      if (scheduledTime.isBefore(now) || scheduledTime.isAtSameMomentAs(now)) {
        debugPrint('Adjusting notification $i as it would be in the past');
        scheduledTime = now.add(const Duration(seconds: 5));
      }

      final notificationId = baseId + i;

      try {
        await flutterLocalNotificationsPlugin.zonedSchedule(
          notificationId,
          title,
          body,
          scheduledTime,
          notificationDetails,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

        );
        debugPrint('Scheduled notification $notificationId for $scheduledTime');
      } catch (e) {
        debugPrint('Failed to schedule notification $notificationId: $e');
      }
    }
  }
}
