import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class NestedMainScreen extends StatefulWidget {
  const NestedMainScreen({super.key});

  @override
  State<NestedMainScreen> createState() => _NestedMainScreenState();
}

class _NestedMainScreenState extends State<NestedMainScreen> {
  @override
  void initState() {
    super.initState();

    debugPrint('init nested main screen');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build nested main screen');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CloseButton(
          onPressed: () => router.pop(),
        ),
        title: const Text('Nested main screen'),
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
