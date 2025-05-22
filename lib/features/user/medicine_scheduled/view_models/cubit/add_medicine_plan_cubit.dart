import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';
import 'package:safe_steps/core/local_notifications/local_notifications_services.dart';
import 'package:safe_steps/core/network/supabase/database/add_data.dart';
import 'package:safe_steps/core/network/supabase/database/stream_data_with_spacific.dart';
import 'package:safe_steps/features/user/medicine_scheduled/models/medicine_plan_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_medicine_plan_state.dart';

class MedicinePlanCubit extends Cubit<MedicinePlanState> {
  MedicinePlanCubit() : super(MedicinePlanInitial()) {
    getMyMedicinePlan();
  }

  StreamSubscription? _myMedicinePlanStreamSubscription;
  List<MedicinePlanModel> myMedicinePlanList = [];
  bool _isClosed = false;

  @override
  Future<void> close() {
    _isClosed = true;
    _myMedicinePlanStreamSubscription?.cancel();
    return super.close();
  }

  void getMyMedicinePlan() {
    if (_isClosed) return;
    
    emit(GetMedicinePlanLoading());
    _myMedicinePlanStreamSubscription?.cancel();
    
    _myMedicinePlanStreamSubscription = streamDataWithSpecificId(
      tableName: "medicine_plan",
      primaryKey: "user_id",
      id: getIt<SupabaseClient>().auth.currentUser!.id.toString(),
    ).listen(
      (event) {
        if (_isClosed) return;
        myMedicinePlanList = event.map((e) => MedicinePlanModel.fromJson(e)).toList();
        emit(GetMedicinePlanSuccess());
      },
      onError: (error) {
        if (_isClosed) return;
        emit(GetMedicinePlanFailure(message: error.toString()));
      },
    );
  }

  // Controllers and state variables
  final medicineNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int time = 1;
  int perDay = 1;

  void increaseTime() {
    time++;
    emit(ChangeTimeState());
  }

  void decreaseTime() {
    if (time > 1) {
      time--;
      emit(ChangeTimeState());
    }
  }

  void increasePerDay() {
    perDay++;
    emit(ChangePerDayState());
  }

  void decreasePerDay() {
    if (perDay > 1) {
      perDay--;
      emit(ChangePerDayState());
    }
  }

  Future<void> addMedicinePlan() async {
    if (!formKey.currentState!.validate()) return;
    
    try {
      emit(AddMedicinePlanLoading());
      
      await addData(tableName: "medicine_plan", data: {
        "user_id": getIt<SupabaseClient>().auth.currentUser!.id.toString(),
        "medicine_name": medicineNameController.text,
        "time": time,
        "per_day": perDay
      });

      await _scheduleNotifications(medicineNameController.text);

      medicineNameController.clear();
      time = 1;
      perDay = 1;
      emit(AddMedicinePlanSuccess());
    } catch (e) {
      emit(AddMedicinePlanFailure(message: e.toString()));
    }
  }

  Future<void> _scheduleNotifications(String medicineName) async {
    try {
      await LocalNotificationsServices.scheduleNotificationsByInterval(
        title: 'Medicine Reminder',
        body: 'Time to take your medication ($medicineName)',
        timesPerDay: time,  // Changed from time to perDay
      );
    } catch (e) {
      debugPrint('Error scheduling notifications: $e');
      // Don't fail the whole operation if notifications fail
    }
  }
}