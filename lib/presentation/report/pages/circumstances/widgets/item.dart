import 'package:blinq/presentation/report/pages/circumstances/bloc/circumstances_bloc.dart';
import 'package:flutter/material.dart';

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
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: const EdgeInsets.all(8),
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
              // style: textStyleBody1(),
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
            onChanged: (value) => onCheckedB() ,
          ),
        ],
      ),
    );
  }
}
