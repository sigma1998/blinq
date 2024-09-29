import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/drawables/app_drawables.dart';
import '../../../core/drawables/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class MainBotNav extends StatefulWidget {
  final int currentIndex;
  final Function onTap;

  const MainBotNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<MainBotNav> createState() => _MainBotNavState();
}

class _MainBotNavState extends State<MainBotNav> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          height: 74.h,
          width: 260.w,
          AppDrawables.botNavContainer,
          fit: BoxFit.fill,
        ),
        Container(
          width: 260.w,
          height: 74.h,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: Iterable.generate(3).map<Widget>((e) {
              return getButton(e);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget getButton(int index) {
    if (widget.currentIndex == index) {
      return Expanded(
        child: Container(
          height: 69.h,
          width: 80.w,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            gradient: LinearGradient(
              colors: [
                AppColors.white,
                AppColors.white.withOpacity(0.5),
                AppColors.white.withOpacity(0.2),
              ], // Gradient colors
              begin: Alignment.topCenter, // Start from the top
              end: Alignment.bottomCenter, // End at the bottom
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              gradient: LinearGradient(
                colors: [
                  AppColors.black,
                  AppColors.black.withOpacity(0.8),
                  AppColors.black.withOpacity(0.5),
                ], // Gradient colors
                begin: Alignment.topCenter, // Start from the top
                end: Alignment.bottomCenter, // End at the bottom
              ),
            ),
            child: getCol(index),
          ),
        ),
      );
    }

    return Expanded(
      child: IconButton(
        onPressed: () {
          widget.onTap.call(index);
        },
        icon: getCol(index),
      ),
    );
  }

  getCol(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          icons[index],
          width: 24.h,
          height: 24.h,
        ),
        Text(
          texts[index],
          style: AppTextStyles.s10W500,
        )
      ],
    );
  }

  List<String> texts = [
    'Home',
    'Contacts',
    'Profile',
  ];

  List<String> icons = [
    AppDrawables.appLogoSVG,
    AppDrawables.contact,
    AppDrawables.profileIcon,
  ];
}
