import 'package:flutter/material.dart';

class ImmutabbleWidget extends StatelessWidget {
  const ImmutabbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding:  const EdgeInsets.all(40),
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              color: Colors.purple,
              child: const Column(
                children: [
                  Text("Hello"),
                ]
              ),
            ),
            ),
        )
      )
    );
  }
}