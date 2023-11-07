// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/navigation_service.dart';

class MyBaseSheet extends StatelessWidget {
  //
  final List<Widget> children;

  const MyBaseSheet({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = bottom != 0;

    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      initialChildSize: 0.95,
      builder: (_, scrollController) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: NavigationService.back,
                          child: SvgPicture.asset(
                            AppDrawables.close,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...children,
                    isKeyboardVisible
                        ? SizedBox(height: bottom)
                        : const SizedBox(),
                    const SafeArea(
                      top: false,
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
