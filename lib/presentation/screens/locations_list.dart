import 'package:favourite_places/models/location.dart';
import 'package:favourite_places/presentation/screens/location_details.dart';
import 'package:favourite_places/presentation/screens/new_location.dart';
import 'package:favourite_places/providers/locations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationsList extends ConsumerWidget {
  const LocationsList({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (ctx, index) => Dismissible(
                  key: ValueKey(locations[index].id),
                  onDismissed: (direction) {
                    _removeLocation(ref, locations[index]);
                  },
                  child: ListTile(
                      onTap: () => _selectLocation(context, locations[index]),
                      title: Text(
                        locations[index].title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                )),
      ),
    );
  }
}
