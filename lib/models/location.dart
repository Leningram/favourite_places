import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Location {
  String title;
  String id;
  final File image;
  Location({required this.title, required this.image}) : id = uuid.v4();
}
