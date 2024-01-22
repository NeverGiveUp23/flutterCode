import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  bool isTicking = false;
  late Timer timer;
  final laps = <int>[];

  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (_onTick),
  //   );
  // }

//Setting the state to tick every second
  void _onTick(Timer timer) {
    if (mounted) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
      laps.clear(); // resets the lap list when user starts a new counter
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _resetTimer() {
    timer.cancel();
    setState(() {
      milliseconds = 0;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  Widget _buildDisplay() {
    return ListView(children: [
      for (int milliseconds in laps)
        ListTile(
          title: Text(_secondsText(milliseconds)),
        )
    ]);
  }

// cancel the timer to stop
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;

    return '$seconds seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StopWatch'),
        ),
        body: Column(children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildDisplay())
        ]));
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor, // setting to the color of the app
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Lap ${laps.length + 1}',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        Text(
          _secondsText(milliseconds),
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(height: 40), // creating space between widgets
        _buildControls()
      ]),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? null : _startTimer,
          child: const Text('Start'),
        ),
        const SizedBox(
          width: 20,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? _stopTimer : null,
          child: const Text('Stop'),
        ),
        const SizedBox(width: 20),
        TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.teal.shade600),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            onPressed: isTicking ? _lap : null,
            child: const Text('Lap')),
        const SizedBox(width: 20),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow.shade900),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            onPressed: _resetTimer,
            child: const Text('Reset'))
      ],
    );
  }
}
