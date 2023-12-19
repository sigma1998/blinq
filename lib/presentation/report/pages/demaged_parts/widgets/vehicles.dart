import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_bloc.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_state.dart';
import 'package:blinq/utils/flood_image/floodfill_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiclesList extends StatelessWidget {
  final ScrollController pageController;
  final ScrollController listController;

  const VehiclesList(
      {Key? key, required this.pageController, required this.listController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DamagedPartsBloc>();
    final width = MediaQuery.of(context).size.width;
    final active = Theme.of(context).colorScheme.primary;

    return BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
      bloc: bloc,
      builder: (context, state) {
        return ListView(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          cacheExtent: 6 * width,
          children: List.generate(
            bloc.vehicleSelect.length,
            (index) {
              return SizedBox(
                width: width - 48,
                child: Center(
                  child: FloodFillImage(
                    imageProvider: AssetImage(bloc.vehicleSelect[index]),
                    fColor: (position) {
                      const inActive = Color(0xff2d2d2d);

                      if (position == null) {
                        return active;
                      }
                      return bloc.onFColor(
                          position: position,
                          active: active,
                          inActive: inActive,
                          index: index,
                          listController: listController);
                    },
                    // tolerance: 8,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
