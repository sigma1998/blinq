// Flutter imports:
import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  //
  final Widget child;
  final bool? expand;

  const ExpandedSection({
    super.key,
    required this.child,
    this.expand = false,
  });

  @override
  State<ExpandedSection> createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  //
  AnimationController? expandController;

  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: widget.expand! ? 1 : 0,
    );
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
  }

  void runExpandCheck() {
    if (widget.expand == true) {
      expandController?.forward();
    } else {
      expandController?.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    runExpandCheck();
  }

  @override
  void dispose() {
    expandController?.dispose();
    expandController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation!,
      child: widget.child,
    );
  }
}
