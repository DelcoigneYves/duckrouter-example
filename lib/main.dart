import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'presentation/routes/routes.dart';

final talker = TalkerFlutter.init();
final observer = TalkerRouteObserver(talker);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
