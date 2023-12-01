import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../presentation.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final signInStore = Modular.get<SignInStore>();

  @override
  void initState() {
    reaction((_) => signInStore.errorMessage, (hasError) {
      if (hasError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade600,
            content: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(signInStore.errorMessage!)),
              ],
            ),
            action: SnackBarAction(
              label: 'Try Again',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        centerTitle: true,
        title: Text(
          "Sign in",
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
                "Don't have an account?",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              TextButton(
                child: Text(
                  "Sign up now!",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () => Modular.to.pushNamed("/signup/"),
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
                errorText: signInStore.email.isNotEmpty
                    ? signInStore.validateEmail()
                    : null,
              ),
              onChanged: signInStore.updateEmail,
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
                    onPressed: () {
                      signInStore.updateIsShowPassword(
                        !signInStore.isShowPassword,
                      );
                    },
                    icon: Icon(
                      signInStore.isShowPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600,
                      ),
                  errorText: signInStore.password.isNotEmpty
                      ? signInStore.validatePassword()
                      : null,
                ),
                obscureText: signInStore.isShowPassword,
                onChanged: signInStore.updatePassword,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
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
                onPressed: signInStore.isValid
                    ? () {
                        signInStore.signInWithEmailAndPassword(
                          email: signInStore.email,
                          password: signInStore.password,
                        );
                      }
                    : null,
                child: Observer(builder: (_) {
                  return Visibility(
                    visible: !signInStore.isLoading,
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
            onPressed: () {
              signInStore.signWithGoogleLogin();
            },
          ),
        ],
      ),
    );
  }
}
