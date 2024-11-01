import 'package:flutter/material.dart';
import 'package:frame_25/frame_25.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '25th frame demo',
      home: Frame25.random(
        frame25: Container(color: Colors.red),
        maxDelayInMilliseconds: 3000,
        child: ColoredBox(
          color: Colors.blue,
          child: Center(
            child: Text(
              "Don't blink!",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}
