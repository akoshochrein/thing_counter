import 'package:flutter/material.dart';
import 'package:thing_counter/components/thing_list_item.dart';
import 'package:thing_counter/persistence/database.dart';

import 'components/create_new_thing_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.database,
  });

  final String title;
  final AppDatabase database;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ThingData> _things = [];
  final List<CountEventData> _countEvents = [];

  void _addThing(String name) async {
    await widget.database.addThing(name);
  }

  void _removeThings() async {
    await widget.database.removeThings();
  }

  void _addCountEvent(ThingData thing) async {
    await widget.database.addCountEvent(thing);
  }

  @override
  Widget build(BuildContext context) {
    final thingSream = widget.database.watchThings();
    final countEvents = widget.database.watchCountEvents();

    thingSream.listen((event) {
      setState(() {
        _things.clear();
        _things.addAll(event);
      });
    });

    countEvents.listen((event) {
      setState(() {
        _countEvents.clear();
        _countEvents.addAll(event);
      });
    });

    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _things.length,
          itemBuilder: (BuildContext context, int index) => ThingListItem(
            thing: _things[index],
            countEvents: _countEvents,
            addCountEvent: _addCountEvent,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => CreateNewThingDrawer(
              addThing: _addThing,
              removeThings: _removeThings,
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
