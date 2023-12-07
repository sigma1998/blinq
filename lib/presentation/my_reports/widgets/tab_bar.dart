// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReportsScreenTabBar extends StatelessWidget {
  //
  final int index;

  final VoidCallback onFirstTabPressed;
  final VoidCallback onSecondTabPressed;

  const ReportsScreenTabBar({
    super.key,
    required this.index,
    //
    required this.onFirstTabPressed,
    required this.onSecondTabPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 34) / 2;

    return SizedBox(
      height: 56,
      width: double.maxFinite,
      child: Row(
        children: [
          InkWell(
            onTap: onFirstTabPressed,
            child: Container(
              width: width,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(400),
                      bottomLeft: Radius.circular(400)),
                  color: index == 0
                      ? Colors.white
                      : Theme.of(context).colorScheme.secondary),
              child: Center(
                  child: Text(
                'strAccident'.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: index == 1 ? Colors.white : Colors.black,
                    ),
              )),
            ),
          ),
          InkWell(
            onTap: onSecondTabPressed,
            child: Container(
              width: width,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(400),
                      bottomRight: Radius.circular(400)),
                  color: index == 1
                      ? Colors.white
                      : Theme.of(context).colorScheme.secondary),
              child: Center(
                child: Text(
                  'strBreakDown'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: index == 1 ? Colors.black : Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
