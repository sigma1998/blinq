// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';

class AppButton extends StatelessWidget {
  //
  final String text;
  final VoidCallback onTap;

  final Color? btnColor;
  final Color txtColor;

  final bool loading;

  final double width;
  final double height;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    //
    this.btnColor,
    this.txtColor = Colors.white,
    //
    this.loading = false,
    //
    this.width = double.infinity,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: btnColor ?? Theme.of(context).colorScheme.primary,
        ),
        child: loading
            ? Loading(color: txtColor)
            : Center(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: txtColor),
                ),
              ),
      ),
    );
  }
}
