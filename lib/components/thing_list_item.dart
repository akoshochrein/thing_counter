import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thing_counter/persistence/database.dart';

class ThingListItem extends StatefulWidget {
  const ThingListItem({
    super.key,
    required this.thing,
    required this.database,
  });

  final ThingData thing;
  final AppDatabase database;

  @override
  State<ThingListItem> createState() => _ThingListItemState();
}

class _ThingListItemState extends State<ThingListItem>
    with TickerProviderStateMixin {
  bool _isOpen = false;
  final List<CountEventData> _countEvents = [];

  void _addCountEvent(ThingData thing) async {
    await widget.database.addCountEvent(thing);
  }

  @override
  Widget build(BuildContext context) {
    final countEvents = widget.database.watchCountEvents(widget.thing);

    countEvents.listen((event) {
      setState(() {
        _countEvents.clear();
        _countEvents.addAll(event);
      });
    });

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
        child: AnimatedSize(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.fastLinearToSlowEaseIn,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                        '${_countEvents.length}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () {
                          _addCountEvent(widget.thing);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              ...(_isOpen
                  ? _countEvents.map(
                      (event) => Text(
                        DateFormat('yyyy-MM-dd HH:mm:ss')
                            .format(event.createdAt),
                      ),
                    )
                  : []),
            ],
          ),
        ),
      ),
    );
  }
}
