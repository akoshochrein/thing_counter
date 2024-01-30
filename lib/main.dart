import 'package:flutter/material.dart';
import 'package:thing_counter/home_page.dart';
import 'package:thing_counter/persistence/database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.database,
  });

  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        database: database,
      ),
    );
  }
}
