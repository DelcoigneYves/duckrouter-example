import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General screen'),
      ),
      body: Column(
        children: [
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
