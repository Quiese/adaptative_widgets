import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptativeTextField extends StatelessWidget {
  final FocusNode focusNode;
  final double height;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final String placeholder;
  final Widget prefix;
  final Widget suffix;
  final TextStyle labelStyle;
  final Color focusedBorderColor;
  final Color focusedBorderErrorColor;
  final Color borderColor;
  final Color backgroundColor;
  final OverlayVisibilityMode clearButtonMode;
  final TextInputAction textInputAction;
  final Function onEditingComplete;
  final Function(String) onSubmitted;
  final Function(String) validator;
  final Function(String) onChange;
  final bool readOnly;
  final bool autofocus;
  final int maxLength;
  final bool enabled;
  final bool obscureText;
  final Widget prefixIcon;
  final bool showBorder;
  final List<TextInputFormatter> textInputFormatter;
  final TextStyle textStyle;

  AdaptativeTextField({
    this.borderColor,
    this.textInputFormatter,
    this.autofocus = false,
    this.obscureText = false,
    this.prefixIcon,
    this.enabled,
    this.validator,
    this.maxLength,
    this.readOnly = false,
    this.onSubmitted,
    this.onEditingComplete,
    this.onChange,
    this.textInputAction,
    this.focusedBorderErrorColor = Colors.redAccent,
    this.focusedBorderColor = Colors.blue,
    this.labelStyle,
    this.clearButtonMode = OverlayVisibilityMode.never,
    this.focusNode,
    this.height = 40,
    this.textEditingController,
    this.prefix,
    this.suffix,
    this.placeholder,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.backgroundColor,
    this.showBorder = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: height,
            child: CupertinoTextField(
              controller: this.textEditingController,
              focusNode: this.focusNode,
              suffix: this.suffix ?? null,
              prefix: this.prefix ?? null,
              placeholder: this.placeholder,
              keyboardType: this.keyboardType,
              decoration: BoxDecoration(
                color: this.showBorder
                    ? this.backgroundColor == null
                        ? Colors.transparent
                        : this.backgroundColor
                    : Colors.transparent,
                border: this.showBorder
                    ? this.borderColor != null
                        ? Border.all(color: this.borderColor)
                        : Border.all(color: Colors.transparent, width: 0.5)
                    : Border(
                        top: BorderSide(
                          color: this.borderColor != null
                              ? this.borderColor
                              : Colors.transparent,
                          style: BorderStyle.none,
                        ),
                        left: BorderSide(
                          color: this.borderColor != null
                              ? this.borderColor
                              : Colors.transparent,
                          style: BorderStyle.none,
                        ),
                        right: BorderSide(
                          color: this.borderColor != null
                              ? this.borderColor
                              : Colors.transparent,
                          style: BorderStyle.none,
                        ),
                        bottom: BorderSide(
                          color: this.borderColor != null
                              ? this.borderColor
                              : Colors.grey[300],
                          style: BorderStyle.solid,
                          width: 0.5,
                        ),
                      ),
                borderRadius:
                    this.showBorder ? BorderRadius.circular(10) : null,
              ),
              autocorrect: false,
              autofocus: this.autofocus,
              maxLength: this.maxLength,
              readOnly: this.readOnly,
              textAlign: this.textAlign,
              clearButtonMode: this.clearButtonMode,
              enabled: this.enabled,
              obscureText: this.obscureText,
              onEditingComplete: this.onEditingComplete,
              onSubmitted: this.onSubmitted,
              onChanged: this.onChange,
              textInputAction: this.textInputAction,
              textCapitalization: this.textCapitalization,
              inputFormatters: this.textInputFormatter,
              keyboardAppearance: MediaQuery.of(context).platformBrightness,
              style: this.textStyle,
            ),
          )
        : Container(
            height: 60,
            child: TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              keyboardType: keyboardType,
              cursorColor: Theme.of(context).primaryColor,
              textInputAction: textInputAction,
              readOnly: readOnly,
              autofocus: autofocus,
              maxLength: maxLength,
              decoration: InputDecoration(
                //suffix: suffix,
                //prefix: prefix,
                // suffixIcon: suffix,
                // prefixIcon: prefix,
                icon: prefix,
                labelText: placeholder,
                labelStyle: labelStyle,
                focusColor: Colors.greenAccent,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: focusedBorderColor),
                ),
                border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: focusedBorderColor.withOpacity(0.3)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: focusedBorderColor.withOpacity(0.3)),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: focusedBorderErrorColor,
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: focusedBorderErrorColor,
                  ),
                ),
              ),
              textAlign: textAlign,
              validator: validator,
              onEditingComplete: onEditingComplete,
              onFieldSubmitted: onSubmitted,
              enabled: enabled,
              obscureText: obscureText,
              textCapitalization: textCapitalization,
              inputFormatters: textInputFormatter,
              autocorrect: false,
            ),
          );
  }
}
