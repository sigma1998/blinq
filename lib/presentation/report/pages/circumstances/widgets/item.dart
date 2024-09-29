// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: driverAActive || driverBActive
            ? AppColors.black
            : AppColors.darkGrey,
        border: Border.all(
          color: AppColors.darkGrey,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isAccident
              ? Checkbox(
                  value: driverAActive,
                  checkColor: Colors.white,
                  activeColor: Theme.of(context).colorScheme.primary,
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  onChanged: (value) => onCheckedA())
              : const SizedBox.shrink(),
          Expanded(
            child: Text(
              Circumstances.values[index].title,
              textAlign: isAccident ? TextAlign.center : TextAlign.start,
              style: AppTextStyles.s16W400,
            ),
          ),
          Checkbox(
            value: driverBActive,
            // ? bloc.state.b.contains(Circumstances.values[index].key)
            //     : bloc.state.a.contains(Circumstances.values[index].key),
            checkColor: Colors.white,
            activeColor: Theme.of(context).colorScheme.primary,
            side: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            onChanged: (value) => onCheckedB(),
          ),
        ],
      ),
    );
  }
}
