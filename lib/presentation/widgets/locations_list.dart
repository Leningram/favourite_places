import 'package:favourite_places/models/location.dart';
import 'package:flutter/material.dart';

class LocationsList extends StatelessWidget {
  const LocationsList(
      {super.key,
      required this.selectLocation,
      required this.locations,
      required this.removeLocation});

  final List<Location> locations;
  final Function(Location location) selectLocation;
  final Function(Location location) removeLocation;

  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return Center(
        child: Text(
          'No locations added',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    }
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
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: FileImage(locations[index].image),
                ),
                subtitle: Text(
                  locations[index].place.address,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                onTap: () => selectLocation(locations[index]),
                title: Text(
                  locations[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ))),
    );
  }
}
