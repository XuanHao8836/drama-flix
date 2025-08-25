import 'package:flutter/material.dart';

extension NavigatorExtensions on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page) {
    return Navigator.of(this).pushReplacement<T, TO>(
      MaterialPageRoute(builder: (context) => page),
    );
  }
  void pushAndRemoveAll(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
          (route) => false,
    );
  }
}