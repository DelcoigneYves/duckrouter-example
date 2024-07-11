import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail screen $id'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              router.navigate(to: DetailRoute(id + 1));
            },
            child: const Text('Open another detail screen'),
          ),
          ElevatedButton(
            onPressed: () {
              router.pop();
            },
            child: const Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              router.popUntil(MainRoute());
            },
            child: const Text('Root'),
          ),
        ],
      ),
    );
  }
}
