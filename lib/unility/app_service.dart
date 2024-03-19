import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rutsproj/models/user_model.dart';
import 'package:rutsproj/states/main_home.dart';
import 'package:rutsproj/unility/app_constant.dart';

class AppService {
  //method ทั่วไป จะทำงานโดยไม่สนใจผลลัพธ์ แต่ thead จะเป็น method ที่ทำงานโดยจะสนใจผลลัพธ์ โดย การเชื่อมต่อฐานข้อมูลจะต้องเป็ฯแบบthead ทุกครั้ง
  Future<void> processCheckLogin(
      {required String user, required String password}) async {
    print('## username ---> $user,password = $password');

    Map<String, dynamic> map = {}; //map คือ json
    map['username'] = user; //map['username'] ชื่อตรงกับคีย์ใน api
    map['password'] = password;

    //await อยู่หน้าคำสั่งที่รอผลลัพธ์ห
    //urlApiLogin อยู่ใน AppConstant คือไฟล์ app_constant.dart
    //ถ้าชูสบาสสำเร็จ ทำงานในปีกกา value คือ status 200
    await Dio().post(AppConstant.urlApiLogin, data: map).then((value) {
      print('## value --> $value');

      UserModel model = UserModel.fromMap(value.data);

      if (model.status == 'ok') {
        //login true

        GetStorage().write('user', model.toMap());

        Get.offAll(const MainHome());//offAll ไปแบบย้อนกลับไม่ได้



      } else {
        Get.snackbar(
          'Login Fail',
          'Please try again',
          backgroundColor: GFColors.DANGER,
          colorText: GFColors.WHITE,
        ); //snackbar alert แล้วหายไปเอง
      }
    });
  }
}
