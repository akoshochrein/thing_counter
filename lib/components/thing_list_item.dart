import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this line to import the intl package
import 'package:thing_counter/persistence/database.dart';

class ThingListItem extends StatefulWidget {
  const ThingListItem({
    super.key,
    required this.thing,
    required this.countEvents,
    required this.addCountEvent,
  });

  final ThingData thing;
  final List<CountEventData> countEvents;
  final void Function(ThingData thing) addCountEvent;

  @override
  State<ThingListItem> createState() => _ThingListItemState();
}

class _ThingListItemState extends State<ThingListItem> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    List<CountEventData> events = widget.countEvents
        .where((event) => event.thing == widget.thing.id)
        .toList();
    return GestureDetector(
      onLongPress: () => setState(() {
        _isOpen = !_isOpen;
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.thing.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Text(
                      '${events.length}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        widget.addCountEvent(widget.thing);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            ...(_isOpen
                ? events.map(
                    (event) => Text(
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(event.createdAt),
                    ),
                  )
                : []),
          ],
        ),
      ),
    );
  }
}
