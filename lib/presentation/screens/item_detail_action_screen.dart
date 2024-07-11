import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class ItemDetailActionScreen extends StatelessWidget {
  const ItemDetailActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item detail action screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              router.popUntil(ItemListRoute());
            },
            child: const Text('Back to root'),
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
