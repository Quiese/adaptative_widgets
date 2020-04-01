import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AdaptativeButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPressed;
  final double width;
  final double height;
  final Color disabledColor;
  final FocusNode focusNode;
  final EdgeInsetsGeometry margin;
  final bool filledButton;

  AdaptativeButton({
    this.focusNode,
    this.disabledColor = Colors.grey,
    this.height,
    this.width,
    this.color,
    @required this.child,
    this.onPressed,
    this.margin,
    this.filledButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Platform.isIOS
          ? this.filledButton
              ? CupertinoButton.filled(
                  //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: child,
                  onPressed: onPressed,
                  disabledColor: disabledColor,
                )
              : CupertinoButton(
                  child: child,
                  onPressed: onPressed,
                  disabledColor: disabledColor,
                )
          : MaterialButton(
              color: color,
              disabledColor: disabledColor,
              child: child,
              onPressed: onPressed,
              focusNode: focusNode,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2))),
    );
  }
}
