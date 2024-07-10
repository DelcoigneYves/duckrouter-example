import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item list screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              router.navigate(to: ItemDetailActionRoute());
            },
            child: const Text('Open item detail'),
          ),
          ElevatedButton(
            onPressed: () {
              router.pop();
            },
            child: const Text('Pop'),
          ),
        ],
      ),
    );
  }
}
