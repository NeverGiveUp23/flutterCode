import 'package:flutter/material.dart';
import 'package:flutterdogs/labeled_container.dart';

class FlexScreen extends StatelessWidget {
  const FlexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flexible and Expanded!'),
        ),
        body: SafeArea( // to not cover up certain nothes on device
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                ..._header(context, "Expanded"),
              const DemoExpanded(),
              ..._header(context, "Flexible"),
              const DemoFlexible(),
              const Expanded(
                child: Spacer(),
              ),
              const DemoFooter(),
            ],
          ),
        ));
  }
}

Iterable<Widget> _header(BuildContext context, String text) {
  return [
    const SizedBox(height: 20),
    Text(text, style: Theme.of(context).textTheme.headlineSmall)
  ];
}

class DemoExpanded extends StatelessWidget {
  const DemoExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child:  Row(
        children: [
          LabeledContainer(
            text: '100', 
            width: 100, 
            color: Colors.green,
            ),
            Expanded(
              child: LabeledContainer(
                color: Colors.purple,
                text: 'The Remainder',
                textColor: Colors.white,
              ),
            ),
            LabeledContainer(
              width: 40,
              color: Colors.green,
              text: '40',
            ),
        ],
      ),
    );
  }
}


class DemoFlexible extends StatelessWidget {
  const DemoFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        children:  [
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.orange,
              text: '25%',
            ),
          ),
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.deepOrange,
              text: '25%',
            ),
          ),
          Flexible(
            flex: 2,
            child: LabeledContainer(
              color: Colors.blue,
              text: '50%',
            )
          )
        ]
      ),
    );
  }
}


class DemoFooter extends StatelessWidget {
  const DemoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 30,
        ),
        child:  Text(
          'Pinned to the Bottom',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      )
    );
  }
}
