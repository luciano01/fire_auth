import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<SignInStore>();
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 56,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                child: const Text("Sign up now!"),
                onPressed: () => Modular.to.pushNamed("/signup/"),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        children: [
          const SizedBox(height: 250),
          const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              labelText: "Email",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility_off,
                  ),
                  onPressed: () {},
                ),
              ),
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 48),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continue"),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
