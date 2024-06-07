import 'dart:io';

import 'package:favourite_places/presentation/widgets/image_input.dart';
import 'package:favourite_places/presentation/widgets/location_input.dart';
import 'package:favourite_places/providers/locations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewLocation extends ConsumerStatefulWidget {
  const NewLocation({super.key});

  @override
  ConsumerState<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends ConsumerState<NewLocation> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _addLocation() {
    final title = _titleController.text;
    if (title.isEmpty || _selectedImage == null) {
      return;
    }
    ref.read(locationsProvider.notifier).addLocation(title, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add location')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: const InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 30),
            ImageInput(
              onSelectImage: (image) => {_selectedImage = image},
            ),
            const SizedBox(height: 10,),
            const LocationInput(),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: _addLocation,
              label: const Text('Add place'),
            )
          ],
        ),
      ),
    );
  }
}
