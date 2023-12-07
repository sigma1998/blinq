// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class MainBottomNavigationItem extends StatefulWidget {
  //
  final VoidCallback onTap;

  final bool isActive;

  final String icon;

  const MainBottomNavigationItem({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.icon,
  });

  @override
  State<MainBottomNavigationItem> createState() =>
      _MainBottomNavigationItemState();
}

class _MainBottomNavigationItemState extends State<MainBottomNavigationItem>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController _controller;

  double _scale = 1;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(_addListener);
  }

  void _addListener() {
    _scale = 1 - _controller.value;
    updateState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: SvgPicture.asset(
          widget.icon,
          colorFilter: ColorFilter.mode(
            widget.isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
