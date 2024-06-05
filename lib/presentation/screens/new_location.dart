import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewLocation extends ConsumerStatefulWidget {
  const NewLocation({super.key});

  @override
  ConsumerState<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends ConsumerState<NewLocation> {
  TextEditingController _enteredName;
  void createLocation() {}
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
