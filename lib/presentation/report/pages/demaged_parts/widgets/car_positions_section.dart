import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/damaged_parts_bloc.dart';
import '../bloc/damaged_parts_state.dart';

class CarPositionsSection extends StatelessWidget {
  final ValueNotifier<int> valueNotifier;

  const CarPositionsSection({
    super.key,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DamagedPartsBloc>();
    return BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
      builder: (context, state) {
        return ValueListenableBuilder<int>(
          valueListenable: valueNotifier,
          builder: (BuildContext context, int value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: Iterable.generate(5).map<Widget>((e) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          valueNotifier.value = e;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: e == 0 ? 0 : 8.0.w),
                          child: Container(
                            height: 96.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: e == value
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            child: Image.asset(
                              bloc.vehicleSelect[e],
                              height: 64,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
            return SizedBox(
              height: 96.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bloc.vehicleSelect.length,
                padding: const EdgeInsets.only(left: 8),
                itemBuilder: (BuildContext context, int index) {
                  return value == index
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            valueNotifier.value = index;
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: Container(
                              width: 84.w,
                              height: 96.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.darkGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                bloc.vehicleSelect[index],
                                width: 64,
                                height: 64,
                              ),
                            ),
                          ),
                        );
                },
              ),
            );
          },
        );
      },
    );
  }
}
