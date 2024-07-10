import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (router.routerDelegate.currentConfiguration.locations
                  .any((element) => element is MainRoute)) {
                router.root();
              } else {
                router.navigate(to: MainRoute());
              }
            },
            child: const Text('Open main screen'),
          ),
        ],
      ),
    );
  }
}
