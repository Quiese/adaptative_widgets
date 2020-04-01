import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'adaptative_base_bar_widget.dart';

class AdaptativeScaffold extends StatelessWidget {
  const AdaptativeScaffold({
    this.bar,
    @required this.child,
    this.drawer,
    this.bottomNavigationBar,
    this.backgroundColor,
    Key key,
  }) : super(key: key);

  final AdaptativeBaseBarWidget bar;
  final Widget child;
  final Drawer drawer;
  final Widget bottomNavigationBar;
  get barActions => _buildActions();
  final Color backgroundColor;

  bool get _hasTrailing =>
      (bar?.trailingOrActions != null && bar.trailingOrActions?.length != 0);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            key: this.key,
            backgroundColor: this.backgroundColor,
            navigationBar: this.bar != null
                ? CupertinoNavigationBar(
                    automaticallyImplyLeading: true,
                    leading: this.bar.leading != null ? this.bar.leading : null,
                    middle: this.bar.title != null ? this.bar.title : null,
                    trailing: barActions,
                    border: null,
                    backgroundColor: this.bar.backgroundColor != null
                        ? this.bar.backgroundColor
                        : Colors.transparent,
                  )
                : CupertinoNavigationBar(
                    automaticallyImplyLeading: false,
                    automaticallyImplyMiddle: false,
                    border: null,
                    backgroundColor: CupertinoColors.systemBackground,
                  ),
            child: child,
          )
        : Scaffold(
            backgroundColor: this.backgroundColor,
            appBar: bar != null
                ? AppBar(
                    bottomOpacity: 0.0,
                    elevation: 0.5,
                    centerTitle: true,
                    leading: bar.leading != null ? bar.leading : null,
                    title: bar.title != null ? bar.title : null,
                    actions: barActions,
                    backgroundColor: bar.backgroundColor != null
                        ? bar.backgroundColor
                        : null)
                : null,
            drawer: this.drawer != null ? this.drawer : null,
            bottomNavigationBar:
                bottomNavigationBar != null ? bottomNavigationBar : null,
            body: child,
          );
  }

  _buildActions() {
    if (_hasTrailing) {
      if (Platform.isIOS) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: bar.trailingOrActions,
        );
      }
      return bar.trailingOrActions;
    }
  }
}
