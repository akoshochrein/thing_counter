import 'package:flutter/material.dart';
import 'package:thing_counter/models/count_event.dart';
import 'package:thing_counter/persistence/database.dart';

class ThingListItem extends StatefulWidget {
  const ThingListItem({
    super.key,
    required this.thing,
    required this.countEvents,
    required this.addCountEvent,
  });

  final ThingData thing;
  final List<CountEvent> countEvents;
  final void Function(CountEvent countEvent) addCountEvent;

  @override
  State<ThingListItem> createState() => _ThingListItemState();
}

class _ThingListItemState extends State<ThingListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.thing.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              Text(
                '${widget.countEvents.where((event) => event.thing == widget.thing).length}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  widget.addCountEvent(
                    CountEvent(
                      thing: widget.thing,
                    ),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
