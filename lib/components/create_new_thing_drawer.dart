import 'package:flutter/material.dart';

class CreateNewThingDrawer extends StatefulWidget {
  const CreateNewThingDrawer({
    super.key,
    required this.addThing,
    required this.removeThings,
  });

  final void Function(String name) addThing;
  final void Function() removeThings;

  @override
  State<CreateNewThingDrawer> createState() => _CreateNewThingDrawerState();
}

class _CreateNewThingDrawerState extends State<CreateNewThingDrawer> {
  String newThingName = '';

  void _setNewThingName(String name) {
    setState(() {
      newThingName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (name) {
              _setNewThingName(name);
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.addThing(newThingName);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
          ElevatedButton(
            onPressed: () {
              widget.removeThings();
              Navigator.pop(context);
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
