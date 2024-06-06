import 'package:favourite_places/providers/locations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewLocation extends ConsumerStatefulWidget {
  const NewLocation({super.key});

  @override
  ConsumerState<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends ConsumerState<NewLocation> {
  final _enteredName = TextEditingController();
  void createLocation() {}

  void _addLocation() {
    ref.read(locationsProvider.notifier).addLocation(_enteredName.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add location')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _enteredName,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: const InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _addLocation,
              child: const SizedBox(
                width: 90,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text('Add place')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
