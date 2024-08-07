import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

ReactiveTextField textFieldWithIcon(
    IconData icon,
    String formControlName,
    String hint,
    bool obscureText,
    Map<String, ValidationMessageFunction> validationMessages) {
  return ReactiveTextField(
    formControlName: formControlName,
    decoration: InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15, end: 25.0),
        child: Icon(icon,
            size: 15,
            color: Color(0xff949494)), // _myIcon is a 48px-wide widget.
      ),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 40,
        minHeight: 25,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      hintText: hint,
      hintStyle: AppTheme.dustyGrayMedium16,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(width: 1, color: Colors.blueGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.blueGrey),
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.redAccent)),
    ),
    obscureText: obscureText,
    validationMessages: validationMessages,
  );
}
