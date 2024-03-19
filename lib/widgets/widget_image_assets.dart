// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rutsproj/states/authen.dart';

class widgetImageAsset extends StatelessWidget {
  const widgetImageAsset({
    Key? key,
    this.size,
  }) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/authen.png',
      width: size,
      height: size,
    );
  }
}
