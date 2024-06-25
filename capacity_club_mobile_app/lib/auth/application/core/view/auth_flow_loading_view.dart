import 'package:flutter/material.dart';

class AuthLoadingView extends StatefulWidget {
  const AuthLoadingView({super.key});

  @override
  State<AuthLoadingView> createState() => _AuthFlowLoadingViewState();
}

class _AuthFlowLoadingViewState extends State<AuthLoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
            opacity: _animationController,
            child: Image.asset('assets/img/icon_logo_v2.png', width: 300)),
      ),
    );
  }
}
