
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_bloc.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_state.dart';
import 'package:blinq/utils/flood_image/floodfill_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiclesList extends StatelessWidget {
  const VehiclesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DamagedPartsBloc>();
    final width = MediaQuery.of(context).size.width;
    final active = Theme.of(context).colorScheme.primary;

    return BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
      builder: (context, state) {
        return ListView(
          scrollDirection: Axis.horizontal,
          controller: bloc.scrollController,
          physics: const NeverScrollableScrollPhysics(),
          cacheExtent: 6 * width,
          children: List.generate(
            bloc.carsSelect.length,
            (index) {
              return SizedBox(
                width: width - 48,
                child: Center(
                  child: RepaintBoundary(
                    key: bloc.getKey(index),
                    child: FloodFillImage(
                      imageProvider: AssetImage(bloc.carsSelect[index]),
                      fColor: (position) {
                        final inActive =
                            Theme.of(context).colorScheme.inversePrimary;

                        if (position == null) {
                          return active;
                        }
                        return bloc.onFColor(
                            position: position,
                            active: active,
                            inActive: inActive,
                            index: index);
                      },
                      tolerance: 8,
                      avoidColor: const [
                        Colors.white,
                        Colors.transparent,
                        Colors.grey
                      ],
                    ),
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
