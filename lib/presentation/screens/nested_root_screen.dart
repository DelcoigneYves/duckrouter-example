import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class NestedRootScreen extends StatefulWidget {
  const NestedRootScreen({super.key});

  @override
  State<NestedRootScreen> createState() => _NestedRootScreenState();
}

class _NestedRootScreenState extends State<NestedRootScreen> {
  @override
  void initState() {
    super.initState();

    debugPrint('init nested root screen');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build nested root screen');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CloseButton(
          onPressed: () => router.pop(),
        ),
        title: const Text('Nested root screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              router.navigate(to: NestedSecondRoute());
            },
            child: const Text('Open second screen'),
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
