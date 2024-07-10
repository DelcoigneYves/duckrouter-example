import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item detail screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              router.navigate(to: ItemDetailActionRoute());
            },
            child: const Text('Open detail action'),
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
