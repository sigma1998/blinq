import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BluetoothPageIndicator extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  BluetoothPageIndicator({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      height: 44.h,
      child: GlassContainer(
        radius: 12,
        padding: const EdgeInsets.all(4),
        child: Row(
          children: Iterable.generate(2).map<Widget>((e) {
            return getButton(e);
          }).toList(),
        ),
      ),
    );
  }

  getButton(int index) {
    if (currentIndex == index) {
      return Expanded(
        child: GlassContainer(
          radius: 10,
          child: Text(
            texts[index],
            style: AppTextStyles.s15W600.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppColors.grey2.withOpacity(0.5); // Color when pressed
                }
                return Colors.transparent; // Default color
              },
            ),

            // Adjust elevation (optional, useful if using ElevatedButton)
            elevation: WidgetStateProperty.resolveWith<double?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return 5.0; // Elevation when pressed
                }
                return 0.0; // Default elevation
              },
            ),
          ),
          onPressed: () {
            onTap.call(index);
          },
          child: Text(
            texts[index],
            textAlign: TextAlign.center,
            style: AppTextStyles.s15W600.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      );
    }
  }

  final List<String> texts = [
    'Scan',
    'History',
  ];
}
