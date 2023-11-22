// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

class ConnectToBlinqItem extends StatefulWidget {
  //
  const ConnectToBlinqItem({super.key});

  @override
  State<ConnectToBlinqItem> createState() => _ConnectToBlinqItemState();
}

class _ConnectToBlinqItemState extends State<ConnectToBlinqItem> {
  //
  late Timer _timer;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    changeCurrentIndex();
  }

  void changeCurrentIndex() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) {
        _currentIndex = (_currentIndex + 1) % 5;
        updateState();
      },
    );
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          final shouldChangeColor = (index == _currentIndex);

          return AnimatedContainer(
            width: 8,
            height: 8,
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(bottom: 32),
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              color: shouldChangeColor
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
