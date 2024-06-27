import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:flutter/material.dart';

class basicInkWell extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  const basicInkWell({Key? key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppTheme.transparent,
      highlightColor: AppTheme.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
