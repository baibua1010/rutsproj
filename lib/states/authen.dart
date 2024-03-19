import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rutsproj/unility/app_constant.dart';
import 'package:rutsproj/unility/app_controller.dart';
import 'package:rutsproj/unility/app_service.dart';
import 'package:rutsproj/widgets/widget_button.dart';
import 'package:rutsproj/widgets/widget_form.dart';
import 'package:rutsproj/widgets/widget_icon_button.dart';
import 'package:rutsproj/widgets/widget_image_assets.dart';
import 'package:rutsproj/widgets/widget_text.dart';

//stateless ประกาศตัวแปรไม่ได้ ต้องupgrade เป็น statefull

//class Authen extends StatelessWidget {

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //นี่คือ dependency สำหรับ call ตัวแปรที่อยู่ใน Controller
  AppController appController = Get.put(AppController());

  //คือค่า key ที่ใช้จับการเปลี่ยนแปลงของ  widgetForm
  final keyForm = GlobalKey<
      FormState>(); //<FormState> กำหนด data type เป็น form สนใจเฉพาะform

  TextEditingController userCoontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          //GestureDetector จะคลิกได้
          //() => arrow function ทำงานอย่างเดียว
          child: ListView(
            // listview จะทำให้จอเลื่อนได้  ถ้า coloumn ไม่ได้
            children: [
              // wrap with column จะอยู่ตรงกลาง
              Column(
                children: [
                  displayImage(),
                  displayAppName(),
                  pathForm(),
                  //เอา container ไป wrap widget button เพื่อทำcss
                  loginButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container loginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 250,
      //color: Color.fromARGB(255, 228, 207, 24),
      child: widgetButton(
        text: 'Login',       
        pressFunc: () {
          if (keyForm.currentState!.validate()) {

            context.loaderOverlay.show();
            


            AppService().processCheckLogin(
                user: userCoontroller.text, password: passwordController.text).then((value) => context.loaderOverlay.hide());



          }
        },
      ),
    );
  }

  Widget pathForm() {
    //keyForm จะทำหน้าที่ ดูแล form สองตัวที่ภายใน
    return Form(
      key: keyForm,
      child: Column(
        children: [
          widgetForm(
            textEditingController: userCoontroller,
            validateFunc: (p0) {
              //p0 คือตัวแปรที่รับค่าจากการคีย์ในช่อง username
              //การทำ validate
              //if else statement
              if (p0?.isEmpty ?? true) {
                //ถ้าว่าง return true
                return 'Please Fill Username';
              } else {
                return null;
              }
            },
            hint: 'Username: ',
            subfixWidget: Icon(Icons.face_5),
          ), //https://fonts.google.com/iconss
          Obx(() => widgetForm(
              textEditingController: passwordController,
              validateFunc: (p0) {
                if (p0?.isEmpty ?? true) {
                  return 'Please Fill Password';
                } else {
                  return null;
                }
              },
              // ต้องครอบด้วย Obx เพื่อให้มันสามารถเปลี่ยนค่าไปมาได้
              hint: 'Password: ',
              //obscu: true,
              obscu: appController.redEye
                  .value, // ดึงค่ามาจาก controller แทนการกำหนดค่า true false
              subfixWidget: widgetIconButton(
                // ? การเขียนเงื่อนไขอย่างสั้น ถ้าเป็นจริง Icons.remove_red_eye ถ้าเป็น false Icons.remove_red_eye_outlined
                iconData: appController.redEye.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                pressFunc: () {
                  //แตะที่ดวงตา จะทำงานในนี้

                  appController.redEye.value = !appController.redEye.value;
                },
              ))),
        ],
      ),
    );
  }

  widgetText displayAppName() {
    return widgetText(
      data: AppConstant.appName,
      textStyle: AppConstant().h1Style(),
    );
  }

  widgetImageAsset displayImage() {
    return const widgetImageAsset(
      size: 250,
    );
  }
}
