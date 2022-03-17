import 'dart:async';
import 'package:code_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

class AnimationWidgetScreen extends StatefulWidget {
  const AnimationWidgetScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimationWidgetScreen> createState() => _AnimationWidgetScreenState();
}

class _AnimationWidgetScreenState extends State<AnimationWidgetScreen> {

  //MARK:- Properties
  ///
  late Timer _timer;
  ///
  bool _changeHeight = false;
  ///
  bool _timerStarted = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
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
             Text(
              Constants.goodLuck,
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

  void _startTimer() {
    if (_timerStarted == false) {
      _timerStarted = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          _changeHeight = !_changeHeight;
        });
      });
    }
  }

  void _stopTimer() {
    if (_timerStarted) {
      _timerStarted = false;
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

}
