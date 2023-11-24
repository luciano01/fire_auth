import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fire_auth/features/presentation/presentation.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signInState = Modular.get<SignInStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            child: const Text("SignIn"),
            onPressed: () {
              signInState.signIn();
            },
          ),
        ],
      ),
    );
  }
}
