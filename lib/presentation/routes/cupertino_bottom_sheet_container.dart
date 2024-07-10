import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoBottomSheetContainer extends StatelessWidget {
  final Widget child;
  final Radius topRadius;
  final Color? backgroundColor;

  const CupertinoBottomSheetContainer({
    super.key,
    required this.child,
    required this.topRadius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final topPadding = 16 + topSafeAreaPadding;

    const shadow =
        BoxShadow(blurRadius: 30, color: Colors.black26, spreadRadius: 15);
    final backgroundColor = this.backgroundColor ??
        CupertinoTheme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: const [shadow],
          borderRadius: BorderRadius.only(
            topLeft: topRadius,
            topRight: topRadius,
          ),
        ),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: topRadius),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: child,
          ),
        ),
      ),
    );
  }
}
