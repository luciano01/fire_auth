import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signInStore = Modular.get<SignInStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.login),
        onPressed: () {
          signInStore.signInWithEmailAndPassword(
            email: "jaina@email.com",
            password: "jaina123",
          );
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("SignUp"),
              onPressed: () {
                signInStore.createUserWithEmailAndPassword(
                  email: "guldan@email.com",
                  password: "guldan123",
                );
              },
            ),
            Observer(builder: (_) {
              return Text(signInStore.errorMessage);
            }),
          ],
        ),
      ),
    );
  }
}
