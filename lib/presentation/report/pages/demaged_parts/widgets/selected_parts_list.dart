// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_bloc.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedPartsList extends StatefulWidget {
  final ScrollController controller;

  const SelectedPartsList({Key? key, required this.controller})
      : super(key: key);

  @override
  State<SelectedPartsList> createState() => _SelectedPartsListState();
}

class _SelectedPartsListState extends State<SelectedPartsList> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DamagedPartsBloc>();
    return BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
      bloc: bloc,
      builder: (context, state) {
        return SizedBox(
          height: 32.h,
          child: ListView(
            controller: widget.controller,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: bloc.damagedParts.map<Widget>((e) {
              return GestureDetector(
                onTap: () {
                  bloc.removePart(e);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.primaryColor,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Text(
                          e,
                          style: AppTextStyles.s15W600,
                        ),
                        const SizedBox(width: 8),
                        // Container(
                        //   width: 16,
                        //   height: 16,
                        //   alignment: Alignment.center,
                        //   decoration: const BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: AppColors.white,
                        //   ),
                        //   child: const Icon(
                        //     Icons.close,
                        //     size: 12,
                        //     color: AppColors.primaryColor,
                        //   ),
                        // ),
                        // const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
        return SizedBox(
          height: 32.h,
          child: ListView.separated(
            itemCount: bloc.damagedParts.length,
            controller: widget.controller,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  bloc.removePart(bloc.damagedParts.elementAt(index));
                },
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.primaryColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Text(
                        bloc.damagedParts.elementAt(index),
                        style: AppTextStyles.s15W600,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 16,
                        height: 16,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 6,
              );
            },
          ),
        );
      },
    );
  }
}
