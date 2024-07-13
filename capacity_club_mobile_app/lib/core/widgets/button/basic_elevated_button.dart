import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';

class BasicElevatedButton extends StatelessWidget {
  final Color? overlayColor;
  final double? borderRadius;
  final Color? color;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final TextStyle? style;
  final String? text;

  const BasicElevatedButton({
    super.key,
    this.color = AppTheme.deepTeal,
    required this.onPressed,
    this.height = 50,
    this.style = AppTheme.whiteBold16,
    this.text = '',
    this.width,
    this.borderRadius = 10,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(overlayColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10))),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: onPressed,
        child: Text(
          text.toString(),
          style: style,
        ),
      ),
    );
  }
}
