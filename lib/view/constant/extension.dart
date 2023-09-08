import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return widget;
        },
      ),
    );
  }
  void pop(){
    Navigator.pop(this);
  }
}
