import 'package:flutter/material.dart';

class AppConstant {
  //field //share แบบเดี่ยว 

  static String appName='RUTS Regis Officer';

  static String urlApiLogin='https://api.rmutsv.ac.th/elogin';

  //method //share แบบกลุ่ม

  TextStyle h1Style(){
    return const TextStyle(fontSize: 36,fontWeight: FontWeight.bold,);
  }

  TextStyle h2Style(){
    return const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,);//70% ของ bold
  }

  TextStyle h3Style(){
    return const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,);
  }
  
}