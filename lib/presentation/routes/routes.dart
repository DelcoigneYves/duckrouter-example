import 'package:duck_router/duck_router.dart';
import 'package:duckrouter_example/presentation/routes/cupertino_bottom_sheet_container.dart';
import 'package:duckrouter_example/presentation/routes/route_builders.dart';
import 'package:duckrouter_example/presentation/screens/detail_screen.dart';
import 'package:duckrouter_example/presentation/screens/general_available_screen.dart';
import 'package:duckrouter_example/presentation/screens/home_screen.dart';
import 'package:duckrouter_example/presentation/screens/item_detail_action_screen.dart';
import 'package:duckrouter_example/presentation/screens/item_detail_screen.dart';
import 'package:duckrouter_example/presentation/screens/item_list_screen.dart';
import 'package:duckrouter_example/presentation/screens/main_screen.dart';
import 'package:duckrouter_example/presentation/screens/nested_main_screen.dart';
import 'package:duckrouter_example/presentation/screens/nested_second_screen.dart';
import 'package:duckrouter_example/presentation/screens/second_screen.dart';
import 'package:flutter/cupertino.dart';

class ModalPage<T> extends Page<T> {
  final Widget child;

  const ModalPage({
    required this.child,
    required super.name,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return modalSheetBuilder(context, child, this);
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

final router = DuckRouter.withConfig(
    configuration: DuckRouterConfiguration(
  rootNavigatorKey: navigatorKey,
  initialLocation: MainRoute(),
  onNavigate: (destination) {
    debugPrint('Navigated to ${destination.path}');
  },
));

class MainRoute extends Location {
  @override
  String get path => '/main';

  @override
  LocationBuilder? get builder => (_) => const MainScreen();
}

class HomeRoute extends Location {
  @override
  String get path => '/home';

  @override
  LocationBuilder? get builder => (_) => const HomeScreen();
}

class SecondRoute extends Location {
  @override
  String get path => '/second';

  @override
  LocationPageBuilder? get pageBuilder => (_) => const CupertinoPage(
        child: SecondScreen(),
        title: 'Second screen',
      );

  @override
  LocationBuilder? get builder => (_) => const SecondScreen();
}

class GeneralAvailableRoute extends Location {
  @override
  String get path => '/general-available';

  @override
  LocationBuilder? get builder => (_) => const GeneralScreen();
}

class DetailRoute extends Location {
  final int id;

  const DetailRoute(this.id);

  @override
  String get path => '/detail/$id';

  @override
  LocationBuilder? get builder => (_) => DetailScreen(id);
}

class NestedRootRoute extends StatefulLocation {
  @override
  String get path => '/nested/root';

  final GlobalKey<DuckShellState> _key = GlobalKey<DuckShellState>(
    debugLabel: 'StatefulLocationShell',
  );

  @override
  DuckShellState get state => _key.currentState!;

  @override
  LocationPageBuilder? get pageBuilder => (context) => ModalPage(
        name: path,
        child: DuckShell(
          key: _key,
          children: children,
          configuration: DuckRouter.of(context).configuration,
        ),
      );

  @override
  StatefulLocationBuilder get childBuilder =>
      (context, shell) => CupertinoBottomSheetContainer(
            topRadius: const Radius.circular(12),
            child: shell,
          );

  @override
  List<StatefulChildLocation> get children => [NestedMainRoute()];
}

class NestedMainRoute extends StatefulChildLocation {
  @override
  String get path => '/nested/main';

  @override
  LocationPageBuilder? get pageBuilder => (_) => CupertinoPage(
        name: path,
        child: const NestedMainScreen(),
        title: 'Nested main screen',
      );

  @override
  LocationBuilder get builder => (_) => const NestedMainScreen();
}

class NestedSecondRoute extends Location {
  @override
  String get path => '/nested/second';

  @override
  LocationPageBuilder? get pageBuilder => (_) => CupertinoPage(
        name: path,
        child: const NestedSecondScreen(),
        title: 'Nested second screen',
      );

  @override
  LocationBuilder? get builder => (_) => const NestedSecondScreen();
}

class ItemListRootRoute extends StatefulLocation {
  @override
  String get path => '/root/items';

  @override
  StatefulLocationBuilder get childBuilder => (context, shell) => shell;

  @override
  List<StatefulChildLocation> get children => [ItemListRoute()];
}

class ItemListRoute extends StatefulChildLocation {
  @override
  String get path => '/itemlist';

  @override
  LocationPageBuilder? get pageBuilder => (_) => CupertinoPage(
        name: path,
        child: const ItemListScreen(),
        title: 'Item list screen',
      );

  @override
  LocationBuilder get builder => (_) => const ItemListScreen();
}

class ItemDetailRoute extends StatefulChildLocation {
  @override
  String get path => '/itemdetail';

  @override
  LocationPageBuilder? get pageBuilder => (_) => CupertinoPage(
        name: path,
        child: const ItemDetailScreen(),
        title: 'Item detail screen',
      );

  @override
  LocationBuilder get builder => (_) => const ItemDetailScreen();
}

class ItemDetailActionRoute extends StatefulChildLocation {
  @override
  String get path => '/itemdetailaction';

  @override
  LocationPageBuilder? get pageBuilder => (_) => CupertinoPage(
        name: path,
        child: const ItemDetailActionScreen(),
        title: 'Item detail action screen',
      );

  @override
  LocationBuilder get builder => (_) => const ItemDetailActionScreen();
}
