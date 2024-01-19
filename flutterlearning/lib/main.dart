import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: Column(children: [
        Image.network("https://picsum.photos/250?image=9"),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(9.0),
          child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username")),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Notifications "),
            Switch(
                value: value,
                onChanged: (newValue) {
                  setState(() {
                    value = newValue;
                  });
                }),
          ],
        ),
        ElevatedButton(
          child: const Text("Save") , 
           onPressed: () {  }
          )
      ])),
    );
  }
}
