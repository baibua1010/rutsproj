import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rutsproj/unility/app_controller.dart';
import 'package:rutsproj/widgets/body_profile.dart';
import 'package:rutsproj/widgets/body_service.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  AppController appController = Get.put(AppController());

  var titles = <String>['Service', 'Profile'];
  var iconDatas = <IconData>[
    Icons.face_2,
    Icons.person,
  ];
  var bodys = <Widget>[
    const BodyService(),
    const BodyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(appBar: AppBar(title: widgetText(data: titles[appController.indexBody.value]),),)
    );
  }
}
