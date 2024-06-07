import 'dart:io';

import 'package:favourite_places/models/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationsNotifier extends StateNotifier<List<Location>> {
  LocationsNotifier() : super(const []);

  void addLocation(String title, File image) {
    state = [...state, Location(title: title, image: image)];
  }

  void removeLocation(String id) {
    state = state.where((location) => location.id != id).toList();
  }
}

final locationsProvider =
    StateNotifierProvider<LocationsNotifier, List<Location>>((ref) {
  return LocationsNotifier();
});
