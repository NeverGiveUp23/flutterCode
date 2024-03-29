import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImmutabbleWidget extends StatelessWidget {
  const ImmutabbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        padding: const EdgeInsets.all(80),
        child: Transform.rotate(
          angle: 180 / math.pi,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withAlpha(120),
                  spreadRadius: 4,
                  blurRadius: 15,
                  offset: Offset.fromDirection(1.0, 3.0),
                )
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: _buildShinyCircle(),
            ),
          ),
        ));
  }
}

Widget _buildShinyCircle() {
  return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.blueAccent,
            ],
            center: Alignment(-0.5, -0.3),
          ),
          boxShadow: [BoxShadow(blurRadius: 20)]));
}
