import 'package:thing_counter/persistence/database.dart';

class CountEvent {
  final ThingData thing;
  final DateTime timestamp = DateTime.now();

  CountEvent({
    required this.thing,
  });
}
