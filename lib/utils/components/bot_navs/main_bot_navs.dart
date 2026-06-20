import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/drawables/app_drawables.dart';
import '../../../core/drawables/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class MainBotNav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MainBotNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<MainBotNav> createState() => _MainBotNavState();
}

class _MainBotNavState extends State<MainBotNav> {
  static const _texts = ['Home', 'Map', 'Profile'];
  static const _icons = [
    AppDrawables.appLogoSVG,
    Assets.iconsMap,
    AppDrawables.profileIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 70.h,
      child: GlassContainer(
        radius: 24,
        blur: 12,
        child: SizedBox(
          height: 70.h,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, _buildTab),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int index) {
    final isActive = widget.currentIndex == index;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => widget.onTap(index),
        child: _TabContent(
          icon: _icons[index],
          label: _texts[index],
          isActive: isActive,
        ),
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;

  const _TabContent({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    if(!isActive) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24.h,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.white.withAlpha(180),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.s10W500.copyWith(
              color: AppColors.white.withAlpha(180),
            ),
          ),
        ],
      );
    }
    return GlassContainer(
      radius: 20,
      tintColor: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24.h,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.primaryColor : AppColors.white.withAlpha(180),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.s10W500.copyWith(
              color: isActive ? AppColors.white : AppColors.white.withAlpha(180),
            ),
          ),
        ],
      ),
    );
  }
}
