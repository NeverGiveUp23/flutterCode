import 'package:flutter/material.dart';

class ImmutabbleWidget extends StatelessWidget {
  const ImmutabbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(40),
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(60),
        child: const ColoredBox(
          color: Colors.blue,
          ),
      )
    );
  }
}