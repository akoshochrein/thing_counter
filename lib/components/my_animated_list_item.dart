import 'package:flutter/material.dart';

class MyAnimatedListItem extends StatefulWidget {
  const MyAnimatedListItem({
    super.key,
    required this.text,
    required this.index,
    required this.maxIndex,
  });

  final String text;
  final int index;
  final int maxIndex;

  @override
  State<MyAnimatedListItem> createState() => _MyAnimatedListItemState();
}

class _MyAnimatedListItemState extends State<MyAnimatedListItem>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    final double delay = widget.index / widget.maxIndex;

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: -delay, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _opacity = _animation.value;
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Opacity(
          opacity: _opacity < 0 ? 0 : _opacity,
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
