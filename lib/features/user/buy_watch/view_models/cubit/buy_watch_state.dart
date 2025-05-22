part of 'buy_watch_cubit.dart';

@immutable
sealed class BuyWatchState {}

final class BuyWatchInitial extends BuyWatchState {}
final class BuyWatchSuccess extends BuyWatchState {}
final class BuyWatchFailure extends BuyWatchState {
  final String message;
  BuyWatchFailure({required this.message});
}
final class BuyWatchLoading extends BuyWatchState {}
//! change color
final class ChangeWatchColor extends BuyWatchState {
  final String image;
  ChangeWatchColor({required this.image});
}
