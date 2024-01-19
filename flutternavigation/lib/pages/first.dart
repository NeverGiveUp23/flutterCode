import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello, $name"),
        ),
        body: Center(
          child: Column(children: <Widget>[
            TextButton(
              child: const Text("Pop"),
              onPressed: () {
                Navigator.of(context).pop("This is $name from the first page");
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Named Route",
                      arguments: "Felix, Again?");
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
