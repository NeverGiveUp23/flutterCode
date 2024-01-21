import 'package:flutter/material.dart';
import 'package:fluttertraining/basic_screen.dart';
import 'package:fluttertraining/immutable_widget.dart';

void main() => runApp(const StaticApp());

class StaticApp extends StatelessWidget {
  const StaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasicScreen(),
    );
  }
}

bool isEven(int number) {
  if (number % 2 == 0) {
    return true;
  } else {
    return false;
  }
}
