import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _everySecond;
  bool _changeHeight = false;
  bool _timerStarted = false;

  void _startTimer() {
    if (_timerStarted == false) {
      _timerStarted = true;
      _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          _changeHeight = !_changeHeight;
        });
      });
    }
  }

  void _stopTimer() {
    if (_timerStarted) {
      _timerStarted = false;
      _everySecond.cancel();
     // setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      height: _changeHeight ? 75 : 150,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Color(0xff5855DC)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Good luck",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 36),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.white,
              size: 42,
            ),
          ],
        ),
      ),
    );
  }
}
