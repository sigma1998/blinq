import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? btnColor;
  final Color txtColor;

  const AppButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.btnColor,
      this.txtColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: btnColor ?? Theme.of(context).colorScheme.primary,
        ),
        child: Center(
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
