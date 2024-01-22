import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0;
  bool isTicking = false;
  late Timer timer;

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
        ++seconds;
      });
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);

    setState(() {
      isTicking = true;
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
      seconds = 0;
    });
  }

// cancel the timer to stop
  void dispose() {
    timer.cancel();
    super.dispose();
    print(seconds);
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StopWatch'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$seconds ${_secondsText()}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 40), // creating space between widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: isTicking ? null : _startTimer,
                  child: const Text('Start'),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: isTicking ? _stopTimer : null,
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.yellow.shade900),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: _resetTimer,
                    child: const Text('Reset'))
              ],
            )
          ]),
    );
  }
}
