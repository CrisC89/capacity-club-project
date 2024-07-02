import 'package:capacity_club_mobile_app/auth/application/pages/register/widget/register_body_content_widget.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/register/widget/register_bottom_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterLoadedView extends StatefulWidget {
  const RegisterLoadedView({super.key});

  @override
  State<RegisterLoadedView> createState() => _RegisterLoadedViewState();
}

class _RegisterLoadedViewState extends State<RegisterLoadedView> {
  final FormGroup form = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)]),
    'confirmation': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)]),
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: RegisterBottomPage(context),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height * 0.9,
          ),
          child: IntrinsicHeight(
            child: registerBodyContent(context, form),
          ),
        ),
      ),
    );
  }
}
