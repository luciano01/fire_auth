import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeStore homeStore = Modular.get<HomeStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return Column(
                children: [
                  Text(homeStore.userEmail),
                  Text(homeStore.userUid),
                ],
              );
            }),
            ElevatedButton(
              child: const Text("SignOut"),
              onPressed: () {
                homeStore.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
