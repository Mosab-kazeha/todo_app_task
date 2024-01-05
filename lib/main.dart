import 'package:flutter/material.dart';
import 'package:todo_app_task/config/di.dart';
import 'package:todo_app_task/screen/todo_screen.dart';

void main() {
  //setup();
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryTodoScreen(),
    );
  }
}
