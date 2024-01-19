import 'package:flutter/material.dart';

class NamedRoute extends StatelessWidget {
  const NamedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(appBar: AppBar(title: Text("$name")));
  }
}
