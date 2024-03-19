// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class widgetButton extends StatelessWidget {
  const widgetButton({
    Key? key,
    required this.text,
    required this.pressFunc,
  }) : super(key: key);

  final String text;
  final Function() pressFunc;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: pressFunc,
      text: text,
    );
  }
}
