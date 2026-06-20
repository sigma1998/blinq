// Flutter imports:
import 'dart:ffi';

import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/circumstances/bloc/circumstances_bloc.dart';

class CircumstanceItem extends StatelessWidget {
  final int index;
  final VoidCallback onCheckedA;
  final VoidCallback onCheckedB;
  final bool isAccident;
  final bool driverAActive;
  final bool driverBActive;

  const CircumstanceItem(
      {Key? key,
      required this.isAccident,
      required this.index,
      required this.onCheckedA,
      required this.driverAActive,
      required this.driverBActive,
      required this.onCheckedB})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      radius: 12,
      tint: driverAActive || driverBActive ? 0.2 : 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isAccident ?
              checkButton(driverAActive, onCheckedA)
              // ? Checkbox(
              //     value: driverAActive,
              //     checkColor: Colors.white,
              //     activeColor: Theme.of(context).colorScheme.primary,
              //     side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
              //     onChanged: (value) => onCheckedA(),
              //   )
              : const SizedBox.shrink(),
          Expanded(
            child: Text(
              Circumstances.values[index].title,
              textAlign: isAccident ? TextAlign.center : TextAlign.start,
              style: AppTextStyles.s16W400,
            ),
          ),
          checkButton(driverBActive, onCheckedB),
        ],
      ),
    );
  }

  Widget checkButton(bool val, VoidCallback onTap) {
    return IconButton(
      onPressed: () {
        onTap.call();
      },
      icon: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: val ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.white)),
        child: Icon(
          Icons.check_rounded,
          size: 14,
          color: val ? AppColors.black : Colors.transparent,
        ),
      ),
    );
  }
}
