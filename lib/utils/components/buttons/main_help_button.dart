import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/drawables/app_drawables.dart';
import '../../../core/drawables/app_text_styles.dart';

class MainHelpButton extends StatelessWidget {
  final VoidCallback onTap;

  const MainHelpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                width: 220.h,
                height: 220.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0),
                  image: const DecorationImage(
                    image: AssetImage(
                      AppDrawables.mainHelpButton,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'HELP',
            style: AppTextStyles.s32W700,
          )
        ],
      ),
    );
  }
}
