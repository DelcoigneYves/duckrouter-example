import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'cupertino_bottom_sheet_container.dart';

Route<T> modalSheetBuilder<T>(BuildContext context, Widget child, Page<T> page) {
  return CupertinoModalBottomSheetRoute(
    settings: page,
    builder: (context) => child,
    expanded: false,
    enableDrag: true,
    containerBuilder: (context, animation, child) => CupertinoBottomSheetContainer(
      topRadius: const Radius.circular(12),
      child: child,
    ),
  );
}

Route<T> undraggableModalSheetBuilder<T>(BuildContext context, Widget child, Page<T> page) {
  return CupertinoModalBottomSheetRoute(
    settings: page,
    builder: (context) => child,
    expanded: false,
    enableDrag: false,
    containerBuilder: (context, animation, child) => CupertinoBottomSheetContainer(
      topRadius: const Radius.circular(12),
      child: child,
    ),
  );
}
