import 'dart:io';

import 'package:favourite_places/models/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE ${dotenv.env['DB_NAME']}(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)');
    },
    version: 1,
  );
  return db;
}

class LocationsNotifier extends StateNotifier<List<Location>> {
  LocationsNotifier() : super(const []);

  Future<void> loadLocation() async {
    final db = await _getDatabase();
    if (dotenv.env['DB_NAME'] != null) {
      final data = await db.query(dotenv.env['DB_NAME']!);
      final locations = data.map((row) {
        return Location(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            place: PlaceLocation(
              address: row['address'] as String,
              latitude: row['lat'] as double,
              longitude: row['lng'] as double,
            ));
      }).toList();
      state = locations;
    }
  }

  void addLocation(String title, File image, PlaceLocation place) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final Location newLocation =
        Location(title: title, image: copiedImage, place: place);

    final db = await _getDatabase();

    if (dotenv.env['DB_NAME'] != null) {
      db.insert(dotenv.env['DB_NAME']!, {
        'id': newLocation.id,
        'title': newLocation.title,
        'image': newLocation.image.path,
        'lat': newLocation.place.latitude,
        'lng': newLocation.place.longitude,
        'address': newLocation.place.address,
      });
    }
    state = [...state, newLocation];
  }

  void removeLocation(String id) {
    state = state.where((location) => location.id != id).toList();
  }
}

final locationsProvider =
    StateNotifierProvider<LocationsNotifier, List<Location>>((ref) {
  return LocationsNotifier();
});
