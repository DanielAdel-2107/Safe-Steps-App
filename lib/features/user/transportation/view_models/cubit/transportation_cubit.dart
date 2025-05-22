import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'transportation_state.dart';

class TransportationCubit extends Cubit<TransportationState> {
  TransportationCubit() : super(TransportationInitial());

  List<Map<String, dynamic>> fromSuggestions = [];
  List<Map<String, dynamic>> toSuggestions = [];
  Timer? _debounceTimer;
  final String _locationIqApiKey = 'pk.52c69844cb68f67a95da65d9fa143298'; // Replace with your API key
  Map<String, dynamic>? selectedFromDestination;
  Map<String, dynamic>? selectedToDestination;
  String lastFromQuery = '';
  String lastToQuery = '';

  void setFromDestination(Map<String, dynamic> destination) {
    selectedFromDestination = destination;
    log("Selected From: ${selectedFromDestination.toString()}");
    emit(DestinationFromSelected(destination));
  }

  void setToDestination(Map<String, dynamic> destination) {
    selectedToDestination = destination;
    log("Selected To: ${selectedToDestination.toString()}");
    emit(DestinationToSelected(destination));
  }

  void clearSuggestions({bool isFrom = true}) {
    if (isFrom) {
      fromSuggestions = [];
      emit(DestinationFromSuggestionsEmpty());
    } else {
      toSuggestions = [];
      emit(DestinationToSuggestionsEmpty());
    }
  }

  Future<void> fetchDestinationSuggestions({
    required String query,
    required bool isFrom,
  }) async {
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      final lastQuery = isFrom ? lastFromQuery : lastToQuery;

      if (query.isEmpty) {
        if (isFrom) {
          fromSuggestions = [];
          emit(DestinationFromSuggestionsEmpty());
        } else {
          toSuggestions = [];
          emit(DestinationToSuggestionsEmpty());
        }
        return;
      }

      if (query.length < 2) {
        if (isFrom) {
          fromSuggestions = [];
          emit(DestinationFromSuggestionsTooShort());
        } else {
          toSuggestions = [];
          emit(DestinationToSuggestionsTooShort());
        }
        return;
      }

      if (query != lastQuery) {
        if (isFrom) {
          lastFromQuery = query;
        } else {
          lastToQuery = query;
        }
        emit(isFrom
            ? DestinationFromSuggestionsLoading()
            : DestinationToSuggestionsLoading());

        try {
          final queryEncoded = Uri.encodeComponent(query);
          final url =
              'https://api.locationiq.com/v1/autocomplete?key=$_locationIqApiKey&q=$queryEncoded&limit=5&dedupe=1';
          final response = await http.get(Uri.parse(url));

          if (response.statusCode == 200) {
            final data = json.decode(response.body);
            if (data is List && data.isNotEmpty) {
              final newSuggestions = data
                  .where((item) =>
                      item['display_name'] != null && item['display_name'].isNotEmpty)
                  .map<Map<String, dynamic>>((item) => {
                        'name': item['display_name'] ?? 'No name available',
                        'lat': double.tryParse(item['lat'].toString()) ?? 0.0,
                        'lon': double.tryParse(item['lon'].toString()) ?? 0.0,
                      })
                  .toList();

              if (isFrom) {
                fromSuggestions = newSuggestions;
              } else {
                toSuggestions = newSuggestions;
              }
              log("Suggestions: ${newSuggestions.toString()}");
              emit(isFrom
                  ? DestinationFromSuggestionsLoaded(fromSuggestions)
                  : DestinationToSuggestionsLoaded(toSuggestions));
            } else {
              if (isFrom) {
                fromSuggestions = [];
                emit(DestinationFromSuggestionsEmpty());
              } else {
                toSuggestions = [];
                emit(DestinationToSuggestionsEmpty());
              }
            }
          } else {
            log('Failed with status code: ${response.statusCode}');
            emit(DestinationSuggestionsError(
                'Failed to fetch suggestions: ${response.statusCode}'));
          }
        } catch (e) {
          log('Error fetching suggestions: $e');
          emit(DestinationSuggestionsError('Error: $e'));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}