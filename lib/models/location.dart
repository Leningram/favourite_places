import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Location {
  String title;
  String id;
  Location({required this.title}) : id = uuid.v4();
}
