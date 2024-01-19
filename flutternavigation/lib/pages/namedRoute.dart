import 'package:flutter/material.dart';

class NamedRoute extends StatelessWidget {
  const NamedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Route, Welcome!")
      )
    );
  }
}