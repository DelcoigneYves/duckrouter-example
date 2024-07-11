import 'package:duckrouter_example/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class NestedSecondScreen extends StatelessWidget {
  const NestedSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        // This is not working as expected! didPop is always true.
        if (didPop) return;

        final canPop = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: const Text('Warning'),
              content: const Text('Pop or drop'),
              actions: [
                ElevatedButton(
                  onPressed: () => router.pop(true),
                  child: const Text('Pop'),
                )
              ],
            );
          },
        );

        if (canPop) {
          // ignore: use_build_context_synchronously
          router.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nested second screen'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                router.pop();
              },
              child: const Text('pop'),
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState!.pop();
              },
              child: const Text('Pop nested flow'),
            ),
            ElevatedButton(
              onPressed: () {
                router.popUntil(MainRoute());
              },
              child: const Text('Root'),
            ),
          ],
        ),
      ),
    );
  }
}
