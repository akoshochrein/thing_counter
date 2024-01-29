import 'package:flutter/material.dart';
import 'package:thing_counter/models/thing.dart';

class ThingListItem extends StatefulWidget {
  const ThingListItem({super.key, required this.thing});

  final Thing thing;

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
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.thing.count++;
                  });
                },
                icon: const Icon(Icons.add),
              ),
              Text(
                '${widget.thing.count}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.thing.count--;
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
