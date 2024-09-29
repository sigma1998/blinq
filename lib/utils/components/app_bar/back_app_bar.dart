import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onTap;

  const BackAppBar({
    super.key,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                size: 20,
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: onTap ??
                  () {
                    Navigator.of(context).pop();
                  },
            ),
            Expanded(
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: AppTextStyles.s15W600,
              ),
            ),
            IconButton(
              splashColor: Colors.transparent,
              onPressed: () {},
              icon: SizedBox(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 64.h);
}
