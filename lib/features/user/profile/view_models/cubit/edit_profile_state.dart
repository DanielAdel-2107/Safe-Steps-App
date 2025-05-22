part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
final class EditProfileLoading extends EditProfileState {}
final class EditProfileSuccess extends EditProfileState {}
final class EditProfileFailure extends EditProfileState {
  final String errorMessage;
  EditProfileFailure({required this.errorMessage});
}
//
final class UploadImageSuccess extends EditProfileState {}
final class UploadImageFailure extends EditProfileState {
  final String errorMessage;
  UploadImageFailure({required this.errorMessage});
}
final class UploadImageLoading extends EditProfileState {}
final class NoChangesMade extends EditProfileState {}
