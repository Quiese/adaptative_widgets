import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;
  final Color activateColor;
  final Function(double) onChanged;
  final Function(double) onChangeStart;
  final Function(double) onChangeEnd;

  AdaptativeSlider(
      {this.min = 0.0,
      this.max = 1.0,
      this.divisions,
      this.value,
      this.onChanged,
      this.onChangeStart,
      this.onChangeEnd,
      this.activateColor});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSlider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: (value) => onChanged(value),
            onChangeStart: (value) => onChangeStart(value),
            onChangeEnd: (value) => onChangeEnd(value),
            activeColor: activateColor,
          )
        : Slider(
            inactiveColor: activateColor.withOpacity(0.5),
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
            onChangeStart: onChangeStart,
            onChangeEnd: onChangeEnd,
            activeColor: activateColor,
          );
  }
}
