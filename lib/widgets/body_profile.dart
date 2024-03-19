import 'package:flutter/material.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return widgetText(data: 'This is profile');
  }
}