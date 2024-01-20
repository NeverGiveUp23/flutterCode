import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamedRoute extends StatelessWidget {
  const NamedRoute({super.key});

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              // you can pass in a route to go to page like so.
              Navigator.pushNamed(context, '/secondPage');
            },
            child: const Text('Go to Page'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Hello")),
      child: Center(
        child: CupertinoButton(
          child: const Text("Alert"),
          onPressed: () => _showAlertDialog(context),
        ),
      ),
    );
  }
}
