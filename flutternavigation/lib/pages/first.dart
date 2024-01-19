import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String? name;

  const FirstPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello, $name"),
        ),
        body: Center(
          child: Column(children: <Widget>[
            TextButton(
              child: const Text("Pop"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Named Route");
                },
                child: const Text("Named Route")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "home");
                },
                child: const Text("Home"))
          ]),
        ));
  }
}
