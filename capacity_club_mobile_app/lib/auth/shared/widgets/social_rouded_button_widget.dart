import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialRoundedButton extends StatelessWidget {
  final double? size;
  final String? assetImage;
  final VoidCallback? onPressed;
  const SocialRoundedButton({
    super.key,
    this.size = 23,
    required this.assetImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onPressed,
        child: CircleAvatar(
            backgroundColor: AppTheme.transparent,
            radius: size,
            backgroundImage: AssetImage(assetImage!)));
  }
}
