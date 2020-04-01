import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeBaseBarWidget {
  AdaptativeBaseBarWidget({
    this.leading,
    this.title,
    this.trailingOrActions,
    this.backgroundColor,
  });
  final Widget leading;
  final Widget title;
  final List<Widget> trailingOrActions;
  final Color backgroundColor;
}
