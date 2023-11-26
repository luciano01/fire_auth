import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<LaunchStore>();
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
