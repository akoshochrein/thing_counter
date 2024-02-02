import 'package:flutter/material.dart';
import 'package:thing_counter/components/my_animated_list_item.dart';

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({
    super.key,
    required this.strings,
    this.padding = EdgeInsets.zero,
  });

  final List<String> strings;
  final EdgeInsetsGeometry padding;

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
    return Padding(
      padding: widget.padding,
      child: Column(
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
      ),
    );
  }
}
