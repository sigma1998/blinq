import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'bloc/circumstances_bloc.dart';
import 'widgets/item.dart';

class CircumstancesScreen extends StatelessWidget {
  static const String route = 'circumstances_screen';

  const CircumstancesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(padding: const EdgeInsets.all(24.0), children: [
          StepIndicator(
            currentStep: 3,
            title: 'strBreakDown'.tr(),
          ),
          const SizedBox(height: 32,),
          Text(
            'strCircumstance'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            // true ? 'strBigTxt'.tr : 'strBigTxt2'.tr,
            'strBigTxt2'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          const SizedBox(height: 20),
          true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('A',
                            style: Theme.of(context).textTheme.titleLarge),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.white,
                          size: 32,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('B',
                            style: Theme.of(context).textTheme.titleLarge),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          ListView.separated(
            padding: const EdgeInsets.only(top: 10, bottom: 192),
            physics: const ClampingScrollPhysics(),
            itemCount: Circumstances.values.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CircumstanceItem(
                  isAccident: false,
                  index: index,
                  onCheckedA: () {},
                  onCheckedB: () {});
            },
            separatorBuilder: (context, index){
              return const SizedBox(height: 12,);
            },
          ),
        ]),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: NavigationButton(
              onNextTap: () {},
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        extendBody: true,
      ),
    );
  }
}
