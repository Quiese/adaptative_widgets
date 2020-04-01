import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'adaptative_text_field.dart';

class AdaptativeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final Color textFieldBackColor;
  final bool autoFocus;

  const AdaptativeSearchBar({
    Key key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.textFieldBackColor,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptativeTextField(
      autofocus: this.autoFocus,
      showBorder: true,
      focusNode: this.focusNode,
      textEditingController: this.controller,
      backgroundColor: this.textFieldBackColor,
      prefix: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Platform.isIOS
            ? Icon(CupertinoIcons.search, size: 20, color: Colors.grey)
            : Icon(Icons.search, size: 20, color: Colors.grey),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Platform.isIOS
            ? Icon(CupertinoIcons.search, size: 20, color: Colors.grey)
            : Icon(Icons.search, size: 20, color: Colors.grey),
      ),
      //focusedBorderColor: ThemeStyles(context).dividerColor,
      height: 50,
      placeholder: 'Pesquisar',
      textInputAction: TextInputAction.done,
      clearButtonMode: OverlayVisibilityMode.editing,
      onSubmitted: (s) {},
      onChange: this.onChanged,
    );
  }
}
