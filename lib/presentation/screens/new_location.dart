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
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                label: Text('Title')
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const SizedBox(
              width: 90,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.add), 
                SizedBox(width: 10),
                Text('Add place')],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
