import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternavigation/pages/first.dart';
import 'package:flutternavigation/pages/namedRoute.dart';
import 'package:flutternavigation/pages/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        'Named Route': (context) => const NamedRoute(),
        'home': (context) => const MyHomePage(),
        'firstPage': (context) => const FirstPage(),
        '/secondPage': (context) => const SecondPage()
      },
    );
  }
}

int volume = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          IconButton(
            icon: const Icon(Icons.volume_up),
            tooltip: "Increase",
            onPressed: () {
              setState(() {
                volume += 10;
              });
            },
          ),
          Text("Volume: $volume"),

          // Mute Button
          TextButton(onPressed: () {
            setState(() {
              volume = 0;
            });
          }, child: const Text("Mute")),


          TextButton(
            onPressed: () async {
              final response = await Navigator.pushNamed(context, 'firstPage',
                  arguments: "Felix");
            },
            child: const Text("First page"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondPage()));
            },
            child: const Text("Second page"),
          ),
        ],
      )),
    );
  }
}
