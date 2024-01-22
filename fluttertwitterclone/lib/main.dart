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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();

  bool obsureText = true;

  @override
  Widget build(BuildContext context) {
    
    final hiddenPassword = obsureText == true
        ? TextButton(
            onPressed: () {
              setState(() {
                obsureText = false;
              });
            },
            child: const Text("Show Password"))
        : TextButton(
            onPressed: () {
              setState(() {
                obsureText = true;
              });
            },
            child: const Text("Hide Password"));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Twitter"),
          backgroundColor: Colors.blueAccent.shade200,
        ),
        body: Form(
          // for multiple fields
          child: Column(
            children: <Widget>[
            // textFormField -> comes with validator class
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "Enter An Email"),
            ), // email
            TextFormField(
              controller: _passwordControler,
              obscureText: obsureText,
              decoration: const InputDecoration(hintText: "Enter password"),
            ), // password
            ElevatedButton(
                onPressed: () {
                  debugPrint("Email: ${_emailController.text}");
                  debugPrint("Password: ${_passwordControler.text}");
                },
                child: const Text("Submit")),
            // password show / hid
            hiddenPassword
          ]),
        ));
  }
}
