part of 'transportation_cubit.dart';

@immutable
abstract class TransportationState {}

class TransportationInitial extends TransportationState {}

class DestinationFromSuggestionsLoading extends TransportationState {}

class DestinationToSuggestionsLoading extends TransportationState {}

class DestinationFromSuggestionsLoaded extends TransportationState {
  final List<Map<String, dynamic>> suggestions;
  DestinationFromSuggestionsLoaded(this.suggestions);
}

class DestinationToSuggestionsLoaded extends TransportationState {
  final List<Map<String, dynamic>> suggestions;
  DestinationToSuggestionsLoaded(this.suggestions);
}

class DestinationFromSuggestionsEmpty extends TransportationState {}

class DestinationToSuggestionsEmpty extends TransportationState {}

class DestinationFromSuggestionsTooShort extends TransportationState {}

class DestinationToSuggestionsTooShort extends TransportationState {}

class DestinationSuggestionsError extends TransportationState {
  final String errorMessage;
  DestinationSuggestionsError(this.errorMessage);
}

class DestinationFromSelected extends TransportationState {
  final Map<String, dynamic> destination;
  DestinationFromSelected(this.destination);
}

class DestinationToSelected extends TransportationState {
  final Map<String, dynamic> destination;
  DestinationToSelected(this.destination);
}