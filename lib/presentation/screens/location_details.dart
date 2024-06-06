import 'package:favourite_places/models/location.dart';
import 'package:flutter/material.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({super.key, required this.location});

  final Location location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(location.title)),
    );
  }
}
