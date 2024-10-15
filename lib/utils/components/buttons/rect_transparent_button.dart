import 'package:flutter/cupertino.dart';

import '../../../core/theme/app_colors.dart';

class RectTransparentButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;

  const RectTransparentButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0),
        ),
      ),
    );
  }
}
