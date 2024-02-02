import 'package:flutter/material.dart';
import 'package:thing_counter/components/my_animated_list_item.dart';

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({super.key, required this.strings});

  final List<String> strings;

  @override
  State<MyAnimatedList> createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.strings
          .asMap()
          .entries
          .map<Widget>(
            (entry) => MyAnimatedListItem(
              text: entry.value,
              index: entry.key,
              maxIndex: widget.strings.length - 1,
            ),
          )
          .toList(),
    );
  }
}
