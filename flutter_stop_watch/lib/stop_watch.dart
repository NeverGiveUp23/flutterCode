import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stop_watch/platform_alert.dart';

class StopWatch extends StatefulWidget {
  final String name;
  final String email;
  const StopWatch({super.key, required this.name, required this.email});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  bool isTicking = false;

  late Timer timer;
  final laps = <int>[];

  final itemHeight = 60.0;
  final scrollController = ScrollController();

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

  void _stopTimer(BuildContext context) {
    // final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);

    // final alert = PlatformAlert(
    //     title: 'Run Completed',
    //     message: 'Total Run Time is ${_secondsText(totalRuntime)}');
    setState(() {
      timer.cancel();
      isTicking = false;
    });

    final controller =
        showBottomSheet(context: context, builder: _buildRunCompletionSheet);

  // close the controller that shows time final timer. 
    Future.delayed(const Duration(seconds: 3)).then((_) => controller.close());
  }

  Widget _buildRunCompletionSheet(BuildContext context) {
    final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Container(
            color: Theme.of(context).cardColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Run Finished', style: textTheme.headlineSmall),
                  Text('Total Run Time is ${_secondsText(totalRuntime)}')
                ],
              ),
            )));
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

// laps can be long o we need to improve it in case laps get long
    scrollController.animateTo(
      itemHeight * laps.length,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Widget _buildDisplay() {
    // widget to show the scroll bar
    return Scrollbar(
      // improve the scroll in case large data of laps
      child: ListView.builder(
          controller: scrollController,
          itemExtent: itemHeight, // supplies a fixed height
          itemCount: laps
              .length, // builder needs this to determine how long the list will be or else flutter will think it is infinite. => will get out of bounds error.

          // itemBuilder solves this problem by enabling deferred rendering. We are no longer providing Flutter with a list of widgets. Instead, we are waiting for Flutter to use what it needs and only creating widgets for a subset of our list.
          itemBuilder: (context, index) {
            final milliseconds = laps[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 50),
              title: Text('Lap ${index + 1}'),
              trailing: Text(_secondsText(milliseconds)),
            );
          }),
    );
  }

// cancel the timer to stop
  void dispose() {
    timer.cancel();
    scrollController.dispose(); // disppose the list
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
          title: Text(widget.name),
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
        Builder(
          builder: (context) => TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: isTicking ? () => _stopTimer(context) : null,
            child: const Text('Stop'),
          ),
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
