import 'package:flutter/material.dart';

class InjuryScreen extends StatelessWidget {
  //
  static const route = '/injury';

  const InjuryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Injury'),
      ),
    );
  }
}
