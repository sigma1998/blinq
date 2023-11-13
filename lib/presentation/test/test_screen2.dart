import 'package:flutter/material.dart';

class TestScreen2 extends StatelessWidget {
  static const String route = '/TestScreen2';

  const TestScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('TestScreen2'),
      ),
    );
  }
}
