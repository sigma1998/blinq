// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/navigation_service.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  //
  final bool canPop;
  final String title;
  final List<Widget>? actions;

  final void Function()? onPop;

  const MyAppBar({
    super.key,
    required this.title,
    this.canPop = true,
    this.actions,
    this.onPop,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: actions,
      leadingWidth: 40,
      centerTitle: true,
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      leading: canPop
          ? GestureDetector(
              onTap: () {
                onPop ?? NavigationService.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SvgPicture.asset(
                  AppDrawables.arrowLeft,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : null,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
