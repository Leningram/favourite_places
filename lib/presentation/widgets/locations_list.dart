import 'package:favourite_places/models/location.dart';
import 'package:favourite_places/providers/locations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({
    super.key,
    required this.selectLocation,
    required this.locations,
    required this.removeLocation
  });

  final List<Location> locations;
  final Function(Location location) selectLocation;
  final Function(Location location) removeLocation;

  void _removeLocation(WidgetRef ref, Location location) {
    ref.read(locationsProvider.notifier).removeLocation(location.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(locations[index].id),
                onDismissed: (direction) {
                  removeLocation(locations[index]);
                },
                child: ListTile(
                    onTap: () => selectLocation(locations[index]),
                    title: Text(
                      locations[index].title,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              )),
    );
  }
}
