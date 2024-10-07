import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../utils/components/cars/vehicle/vehicle_back_side.dart';
import '../../../../../utils/components/cars/vehicle/vehicle_front_side.dart';
import '../../../../../utils/components/cars/vehicle/vehicle_left_side.dart';
import '../../../../../utils/components/cars/vehicle/vehicle_right_side.dart';
import '../../../../../utils/components/cars/vehicle/vehicle_top_side.dart';
import '../../../../../utils/states/vehicle_parts.dart';

class VehiclePositions extends StatefulWidget {
  final Function onTap;
  final int index;
  final List<CarParts> parts;

  const VehiclePositions({
    super.key,
    required this.onTap,
    required this.index,
    required this.parts,
  });

  @override
  State<VehiclePositions> createState() => _VehiclePositionsState();
}

class _VehiclePositionsState extends State<VehiclePositions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: Iterable.generate(5).map<Widget>((e) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: e == 0 ? 0 : 8.0.w),
            child: Stack(
              children: [
                Container(
                  height: 96.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: e == widget.index
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                  ),
                  child: getList()[e],
                ),
                GestureDetector(
                  onTap: () {
                    widget.onTap.call(e);
                  },
                  child: Container(
                    height: 96.h,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  getList() {
    return [
      VehicleLeftSide(
        onPartPressed: () {},
        parts: widget.parts,
      ),
      VehicleRightSide(
        onPartPressed: () {},
        parts: widget.parts,
      ),
      VehicleTopSide(
        onPartPressed: () {},
        parts: widget.parts,
      ),
      VehicleFrontSideEditor(
        onPartPressed: () {},
        parts: widget.parts,
      ),
      VehicleBackSide(
        onPartPressed: () {},
        parts: widget.parts,
      )
    ];
  }
}
