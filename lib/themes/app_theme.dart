import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  final Color appColor;

  const AppTheme({required this.appColor, required Widget child, Key? key})
      : super(child: child, key: key);

  static Color of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'Error theme');
    return result!.appColor;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => appColor != oldWidget.appColor;
}
