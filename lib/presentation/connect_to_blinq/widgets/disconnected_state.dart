import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class DisconnectedState extends StatelessWidget {
  const DisconnectedState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Disconnected State ',
          style: AppTextStyles.s22W600,
        ),
      ],
    );
  }
}
