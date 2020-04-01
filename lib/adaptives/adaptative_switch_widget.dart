import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeSwitch extends StatelessWidget {
  final bool value;
  final Color activateColor;
  final Function(bool) onChanged;

  AdaptativeSwitch(
      {@required this.value, @required this.onChanged, this.activateColor});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSwitch(
            activeColor: activateColor,
            onChanged: onChanged,
            value: value,
          )
        : Switch(
            activeColor: activateColor,
            onChanged: onChanged,
            value: value,
          );
  }
}
