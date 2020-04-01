import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 30,
          width: 30,
          child: Platform.isIOS
              ? CupertinoActivityIndicator()
              : CircularProgressIndicator(strokeWidth: 2.0)),
    );
  }
}
