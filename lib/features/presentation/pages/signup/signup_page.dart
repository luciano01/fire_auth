import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../state/signup/signup.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpStore = Modular.get<SignUpStore>();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        centerTitle: true,
        title: Text(
          "Sign up",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 56,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              TextButton(
                child: Text(
                  "Sign in!",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () => Modular.to.pop(),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        children: [
          Observer(builder: (_) {
            return TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.deepPurple.shade900,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.grey.shade900,
                  ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.deepPurple.shade900,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey.shade600,
                ),
                hintText: 'Email',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    ),
                errorText: signUpStore.email.isNotEmpty
                    ? signUpStore.validateEmail()
                    : null,
              ),
              onChanged: signUpStore.updateEmail,
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Observer(builder: (_) {
              return TextFormField(
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.deepPurple.shade900,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey.shade900,
                    ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.deepPurple.shade900,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icon(
                    Icons.password_outlined,
                    color: Colors.grey.shade600,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600,
                      ),
                  errorText: signUpStore.password.isNotEmpty
                      ? signUpStore.validatePassword()
                      : null,
                ),
                obscureText: true,
                onChanged: signUpStore.updatePassword,
              );
            }),
          ),
          Observer(builder: (_) {
            return TextFormField(
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.deepPurple.shade900,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.grey.shade900,
                  ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.deepPurple.shade900,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: Colors.grey.shade600,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey.shade600,
                  ),
                ),
                hintText: 'Repeat Password',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    ),
                errorText: signUpStore.repeatPassword.isNotEmpty
                    ? signUpStore.validateRepeatPassword()
                    : null,
              ),
              obscureText: true,
              onChanged: signUpStore.updateRepeatPassword,
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            child: Observer(builder: (_) {
              return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.deepPurple.shade200;
                      } else if (states.contains(MaterialState.disabled)) {
                        return Colors.grey.shade400;
                      }
                      return Colors.deepPurple.shade200;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 48),
                  ),
                ),
                onPressed: signUpStore.isValid
                    ? () {
                        signUpStore.createUserWithEmailAndPassword();
                      }
                    : null,
                child: Observer(builder: (_) {
                  return Visibility(
                    visible: !signUpStore.isLoadingByEmail,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: Text(
                      "Continue",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade900,
                          ),
                    ),
                  );
                }),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ).copyWith(top: 32),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      "Or continue with",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 48),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/core/assets/googleg.png",
                  width: 35,
                ),
                Text(
                  "Sign in with Google",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
