import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rutsproj/states/authen.dart';
import 'package:rutsproj/states/main_home.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: '/authen',
    page: () => const Authen(),
  ),
  GetPage(
    name: '/mainHome',
    page: () => const MainHome(),
  ),
];

String? firstPage;

Future<void> main() async {
  HttpOverrides.global =
      MyHttpOverride(); //ให้การเชื่อต่อพื้นฐานเป็นแบบเดียวกัน ห้ามลืม

  WidgetsFlutterBinding
      .ensureInitialized(); //ถ้าในนี้มีคำสั่งมากกว่า 1 คำสั่ง ให้ทำคำสั่งที่เป็น await ก่อน

  await GetStorage.init().then((value) {
    // ประกาศเป็น Var ให้ขึ้นกับชนิดของค่าที่เข้ามา
    var result = GetStorage().read('user');

    //var result = null;

    if (result != null) {
      firstPage = '/mainHome';
      runApp(MyApp());
    } else {
      firstPage = '/authen';
      runApp(MyApp());
    }

    print('## value at Main --> $result');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: firstPage,
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    //.. ใส่สองจุดคืือการกำหนดค่าเริ่มต้น เพื่อเปิดใช้งาน
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true; // การสร้าง cer
  }
}
