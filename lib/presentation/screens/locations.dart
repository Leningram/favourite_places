import 'package:favourite_places/models/location.dart';
import 'package:favourite_places/presentation/screens/location_details.dart';
import 'package:favourite_places/presentation/screens/new_location.dart';
import 'package:favourite_places/presentation/widgets/locations_list.dart';
import 'package:favourite_places/providers/locations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Locations extends ConsumerWidget {
  const Locations({super.key});

  void _addLocation(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewLocation()));
  }

  void _removeLocation(WidgetRef ref, Location location) {
    ref.read(locationsProvider.notifier).removeLocation(location.id);
  }

  void _selectLocation(BuildContext context, Location location) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => LocationDetails(
              location: location,
            )));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your places'),
          actions: [
            IconButton(
              onPressed: () {
                _addLocation(context);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: LocationsList(
            selectLocation: (Location location) =>
                _selectLocation(context, location),
            locations: locations,
            removeLocation: (Location location) =>
                _removeLocation(ref, location)));
  }
}
