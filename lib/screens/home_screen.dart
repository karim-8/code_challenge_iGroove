import 'package:code_challenge/screens/animation_widget_screen.dart';
import 'package:code_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Center(
              child: Text(
                Constants.taskDescription,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, height: 18 / 14),
              ),
            ),
          ),
          AnimationWidgetScreen(),
        ],
      ),
    );
  }
}
