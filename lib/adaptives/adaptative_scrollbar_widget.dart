import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController controller;

  const AdaptativeScrollbar({Key key, this.child, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoScrollbar(child: this.child, controller: this.controller)
        : Scrollbar(child: this.child, controller: this.controller);
  }
}
