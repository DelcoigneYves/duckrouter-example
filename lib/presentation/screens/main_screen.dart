import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              router.navigate(to: SecondRoute());
            },
            child: const Text('Open second screen'),
          ),
          ElevatedButton(
            onPressed: () {
              router.navigate(to: GeneralAvailableRoute());
            },
            child: const Text('Open general screen'),
          ),
          ElevatedButton(
            onPressed: () {
              router.navigate(to: const DetailRoute(1));
            },
            child: const Text('Open detail screen'),
          ),
          ElevatedButton(
            onPressed: () {
              router.navigate(to: ItemListRootRoute());
            },
            child: const Text('Open item list screen'),
          ),
          ElevatedButton(
            onPressed: () {
              router.navigate(to: ItemDetailActionRoute());
            },
            child: const Text('Open deeplink screen'),
          ),
          ElevatedButton(
            onPressed: () {
              router.navigate(to: HomeRoute());
            },
            child: const Text('Open home screen'),
          ),
        ],
      ),
    );
  }
}
