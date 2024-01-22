import 'package:flutter/material.dart';

class DeepTree extends StatelessWidget {
  const DeepTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center( // centers the widget
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // adjust the center alignment in coloum
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(),
                  Text("Flutter is amazing"),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.purple,
                ),
              ),
              const Text("It's all widgets!"),
              const Text('Let\'s find out how deep the rabbit hole goes.')
            ],
          )
          ),
      ),
    );
  }
}