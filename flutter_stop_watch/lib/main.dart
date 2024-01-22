import 'package:flutter/material.dart';
import 'package:flutter_stop_watch/login_screen.dart';
import './stop_watch.dart';

void main() {
  runApp(const StopWatchApp());
}

class StopWatchApp extends StatelessWidget {
  const StopWatchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
