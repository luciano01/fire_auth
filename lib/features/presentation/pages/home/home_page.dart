import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeStore = Modular.get<HomeStore>();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
            ),
            onPressed: () => homeStore.signOut(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return Visibility(
                visible: !homeStore.isLoading,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Column(
                  children: [
                    Text(homeStore.userEmail),
                    Text(homeStore.userUid),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
