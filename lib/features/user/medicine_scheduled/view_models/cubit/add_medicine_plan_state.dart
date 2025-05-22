part of 'add_medicine_plan_cubit.dart';

@immutable
sealed class MedicinePlanState {}

final class MedicinePlanInitial extends MedicinePlanState {}

final class GetMedicinePlanLoading extends MedicinePlanState {}

final class GetMedicinePlanSuccess extends MedicinePlanState {}

final class GetMedicinePlanFailure extends MedicinePlanState {
  final String message;
  GetMedicinePlanFailure({required this.message});
}

//
final class AddMedicinePlanLoading extends MedicinePlanState {}

final class AddMedicinePlanSuccess extends MedicinePlanState {}

final class AddMedicinePlanFailure extends MedicinePlanState {
  final String message;
  AddMedicinePlanFailure({required this.message});
}
//
final class ChangeTimeState extends MedicinePlanState {}
//
final class ChangePerDayState extends MedicinePlanState {}
