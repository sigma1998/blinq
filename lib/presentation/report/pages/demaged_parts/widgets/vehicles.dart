// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/widgets/type_selector.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_back_side.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_front_side.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_left_side.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_side_selector.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_top_side.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:blinq/utils/services/broken_parts/broken_parts.dart';
import 'package:blinq/utils/states/vehicle_parts.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_bloc.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_state.dart';
import 'package:blinq/utils/flood_image/floodfill_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/components/cars/vehicle/vehicle_right_side.dart';

class VehiclesList extends StatefulWidget {
  final ScrollController pageController;
  final ScrollController listController;
  final ValueNotifier<int> valueNotifier;

  const VehiclesList({
    Key? key,
    required this.pageController,
    required this.listController,
    required this.valueNotifier,
  }) : super(key: key);

  @override
  State<VehiclesList> createState() => _VehiclesListState();
}

class _VehiclesListState extends State<VehiclesList> {
  final brokenParts = BrokenParts();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DamagedPartsBloc>();
    final active = Theme.of(context).colorScheme.primary;

    return BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
      bloc: bloc,
      builder: (context, state) {
        return ValueListenableBuilder<int>(
          valueListenable: widget.valueNotifier,
          builder: (BuildContext context, int index, Widget? child) {
            return IndexedStack(
                index: index,
                children: bloc.vehicleSelect.map<Widget>((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: GlassContainer(
                        radius: 8,
                        tint: 0.08,
                        child: TypeSelector(
                          index: index,
                          parts: bloc.parts,
                          type: bloc.vehicleType,
                          onPartPressed: (CarParts part) {
                            bloc.onPartPressed(part);
                          },
                        ),
                        // child: FloodFillImage(
                        //   imageProvider: AssetImage(bloc.vehicleSelect[index]),
                        //   fColor: (position) {
                        //     const inActive = Color(0xff2d2d2d);
                        //
                        //     if (position == null) {
                        //       return active;
                        //     }
                        //     return bloc.onFColor(
                        //       position: position,
                        //       active: active,
                        //       inActive: inActive,
                        //       index: index,
                        //       listController: widget.listController,
                        //     );
                        //   },
                        //   tolerance: 8,
                        // ),
                      ),
                    ),
                  );
                }).toList());
          },
        );

        // return ListView(
        //   scrollDirection: Axis.horizontal,
        //   controller: widget.pageController,
        //   physics: const NeverScrollableScrollPhysics(),
        //   cacheExtent: 6 * width,
        //   children: List.generate(
        //     bloc.vehicleSelect.length,
        //     (index) {
        //       return SizedBox(
        //         width: width - 48,
        //         child: Center(
        //           child: FloodFillImage(
        //             imageProvider: AssetImage(bloc.vehicleSelect[index]),
        //             fColor: (position) {
        //               const inActive = Color(0xff2d2d2d);
        //
        //               if (position == null) {
        //                 return active;
        //               }
        //               return bloc.onFColor(
        //                   position: position,
        //                   active: active,
        //                   inActive: inActive,
        //                   index: index,
        //                   listController: widget.listController);
        //             },
        //             // tolerance: 8,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // );
      },
    );
  }
}
