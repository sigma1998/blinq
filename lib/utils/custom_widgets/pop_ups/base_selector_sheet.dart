// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';

class MyBaseSelectorSheet extends StatelessWidget {
  //
  final String? title;
  final List<Widget> children;

  final Widget bottomChild;

  final bool isLoading;

  final EdgeInsets padding;
  final double minChildSize;
  final double maxChildSize;
  final double initialChildSize;

  const MyBaseSelectorSheet({
    super.key,
    this.title,
    required this.children,
    this.bottomChild = const SizedBox(),
    //
    this.isLoading = false,
    //
    this.padding = const EdgeInsets.all(18),
    this.minChildSize = 0.5,
    this.maxChildSize = 0.95,
    this.initialChildSize = 0.95,
  });

  //
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = bottom != 0;

    return DraggableScrollableSheet(
      expand: false,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      initialChildSize: isKeyboardVisible ? 0.95 : initialChildSize,
      builder: (_, controller) => Column(
        children: [
          Container(
            width: 55,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: padding,
                    child: ListView(
                      shrinkWrap: true,
                      controller: controller,
                      children: [
                        if (title != null) ...[
                          Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                        ...children,
                        const SafeArea(
                          top: false,
                          child: SizedBox(
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: bottomChild,
                  ),
                  if (isLoading)
                    Container(
                      color: Colors.black45,
                      child: const Loading(),
                    ),
                  isKeyboardVisible
                      ? SizedBox(height: bottom)
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
