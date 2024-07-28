import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: AppTheme.labelTextStyle,
        ),
        Text(
          value,
          style: AppTheme.bodyTextStyle,
        ),
      ],
    );
  }
}
