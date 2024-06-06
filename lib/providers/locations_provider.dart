import 'package:favourite_places/models/location.dart';
import 'package:riverpod/riverpod.dart';

class LocationsNotifier extends StateNotifier<List<Location>> {
  LocationsNotifier() : super(const []);

  void addLocation(String title) {
    state = [...state, Location(title: title)];
  }

  void removeLocation(String id) {
    state = state.where((location) => location.id != id).toList();
  }
}

final locationsProvider =
    StateNotifierProvider<LocationsNotifier, List<Location>>((ref) {
  return LocationsNotifier();
});
