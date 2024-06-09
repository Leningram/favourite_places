import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  PlaceLocation(
      {required this.address, required this.latitute, required this.longitude});
  final double latitute;
  final double longitude;
  final String address;
}

class Location {
  String title;
  String id;
  final File image;
  final PlaceLocation place;

  Location({
    required this.title,
    required this.image,
    required this.place,
  }) : id = uuid.v4();
}
