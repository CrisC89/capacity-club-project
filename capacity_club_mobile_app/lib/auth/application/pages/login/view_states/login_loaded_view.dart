import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginLoadedView extends StatefulWidget {
  const LoginLoadedView({super.key});

  @override
  State<LoginLoadedView> createState() => _LoginLoadedViewState();
}

class _LoginLoadedViewState extends State<LoginLoadedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      50), // Limite à 50 caractères
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      20), // Limite à 20 caractères
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print('Press login in button');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
