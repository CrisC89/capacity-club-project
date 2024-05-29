import 'package:auto_size_text/auto_size_text.dart';
import 'package:capacity_club_mobile_app/common/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';

class LoginLoadedView extends StatefulWidget {
  const LoginLoadedView({super.key});

  @override
  State<LoginLoadedView> createState() => _LoginLoadedViewState();
}

class _LoginLoadedViewState extends State<LoginLoadedView> {
  bool isPasswordVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavigationBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height,
          ),
          child: IntrinsicHeight(
            child: bodyContent(
                size, isPasswordVisible, emailController, passwordController),
          ),
        ),
      ),
    );
  }

  Widget bodyContent(
      Size size,
      bool isPasswordVisible,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppTheme.fixPadding * 1.5, vertical: AppTheme.fixPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTheme.heightSpace50,
          Text(AppLocale.signIn.getString(context),
              style: AppTheme.blackBold16, textAlign: TextAlign.center),
          AppTheme.heightSpace30,
          MyTextField(
              controller: emailController,
              hintText: "translation(context).emailId",
              keyboardType: TextInputType.emailAddress),
          AppTheme.heightSpace20,
          MyTextField(
            controller: passwordController,
            hintText: "translation(context).password",
            obscureText: isPasswordVisible,
            textInputAction: TextInputAction.done,
            suffixIcon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.nobel),
            suffixOnPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible),
          ),
          AppTheme.heightSpace5,
          MyInkWell(
            onTap: () => Navigator.pushNamed(context, '/forgotPassScreen'),
            child: Text(
              AppLocale.forgotPassword.getString(context),
              style: AppTheme.deepTealRegular16,
              textAlign: TextAlign.end,
            ),
          ),
          AppTheme.heightSpace20,
          MyElevatedButton(
            text: AppLocale.signIn.getString(context),
            style: AppTheme.whiteBold16,
            onPressed: () {
              Navigator.pushNamed(context, '/signUpScreen');
            },
          ),
          AppTheme.heightSpace20,
          Text(
            "translation(context).orConnectWith",
            style: AppTheme.dustyGrayMedium16,
            textAlign: TextAlign.center,
          ),
          AppTheme.heightSpace5,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialRoundedButton(
                assetImage: 'assets/img/facebook.png',
                size: 19,
              ),
              SocialRoundedButton(
                assetImage: 'assets/img/google.png',
                size: 19,
              ),
            ],
          ),
        ],
      ),
    );
  }

  bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "translation(context).dontHaveAccount",
            style: AppTheme.dustyGrayMedium16,
          ),
          MyInkWell(
            onTap: () => Navigator.pushNamed(context, '/signUpScreen'),
            child: Text(
              "signup",
              // ' ${translation(context).signUp1}',
              style: AppTheme.deepTealBold16,
            ),
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final VoidCallback? suffixOnPressed;
  const MyTextField({
    Key? key,
    this.hintText,
    this.suffixIcon = const SizedBox(),
    this.suffixOnPressed,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          splashColor: AppTheme.transparent,
          highlightColor: AppTheme.transparent,
          icon: suffixIcon!,
          onPressed: suffixOnPressed,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: .5, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: .5, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class MyInkWell extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  const MyInkWell({Key? key, this.onTap, this.child}) : super(key: key);

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

class SocialRoundedButton extends StatelessWidget {
  final double? size;
  final String? assetImage;
  const SocialRoundedButton(
      {Key? key, this.size = 23, required this.assetImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {},
        child: CircleAvatar(
            backgroundColor: AppTheme.transparent,
            radius: size,
            backgroundImage: AssetImage(assetImage!)));
  }
}

class MyElevatedButton extends StatelessWidget {
  final Color? overlayColor;
  final double? borderRadius;
  final Color? color;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final TextStyle? style;
  final String? text;

  const MyElevatedButton({
    Key? key,
    this.color = AppTheme.deepTeal,
    required this.onPressed,
    this.height = 50,
    this.style = AppTheme.whiteBold16,
    this.text = '',
    this.width,
    this.borderRadius = 10,
    this.overlayColor,
  }) : super(key: key);

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

        // color: color,
        onPressed: onPressed,
        // height: height,
        child: AutoSizeText(
          text.toString(),
          style: style,
          maxLines: 1,
        ),
      ),
    );
  }
}
