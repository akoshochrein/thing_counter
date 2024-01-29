import 'package:flutter/material.dart';
import 'package:thing_counter/components/thing_list_item.dart';
import 'package:thing_counter/models/thing.dart';

import 'components/create_new_thing_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String newThingName = '';

  final List<Thing> _things = [
    Thing(name: 'Banana'),
    Thing(name: 'Cigarettes'),
    Thing(name: 'Pushups'),
    Thing(name: 'Something else'),
  ];

  void _addThing(String name) {
    setState(() {
      _things.add(Thing(name: name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _things.length,
          itemBuilder: (BuildContext context, int index) => ThingListItem(
            thing: _things[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => CreateNewThingDrawer(
              addThing: _addThing,
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
