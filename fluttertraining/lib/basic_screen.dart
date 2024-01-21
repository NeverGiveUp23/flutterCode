import 'package:flutter/material.dart';
import 'package:fluttertraining/immutable_widget.dart';
import 'package:fluttertraining/text_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("My App"),
        actions: const [
          Padding(padding: EdgeInsets.all(10.0),
          child: Icon(Icons.edit),
          )
        ],
      ),




      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // adding image to widget w/ semantics for Accesiblity
          Semantics(
            image: true,
            label: 'A beautiful Beach',
            child: Image.asset(
              'assets/beach.jpg'
              )
            ),

        //   AspectRatio(
        //   aspectRatio: 1.0,
        //   child: ImmutabbleWidget(),
        // ),

        const TextLayout(),
        ],
      ),





      // Adding a drawer in the code
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: const Center(
            child: Text("I'm A Drawer!") ,
            )
        )
      ),
    );
  }
}