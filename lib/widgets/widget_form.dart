// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class widgetForm extends StatelessWidget {
  const widgetForm({
    Key? key,
    this.hint,
    this.subfixWidget,
    this.obscu,
    this.validateFunc,
    this.textEditingController,
  }) : super(key: key);

  final String? hint; //สร้างfield ชื่อ hint ประเภท string

  final Widget? subfixWidget;

  final bool? obscu; //red eye password

  final String? Function(String?)? validateFunc; //ทำ validation

  final TextEditingController?
      textEditingController; // สร้างตัวแปรเพื่อรับค่าจากหน้าจอ

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        controller: textEditingController, //สร้างเพื่อรับค่าจากหน้าจอ
        validator: validateFunc,
        obscureText: obscu ?? false,
        //obscu ?? false ถ้าไม่มีค่า จะเอา false มาแทน
        decoration: InputDecoration(
          filled: true,
          //fillColor: Colors.yellow.shade100,
          fillColor: Colors.grey.withOpacity(0.25),
          //fillColor: const Color.fromARGB(255, 228, 207, 24).withOpacity(0.75),
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: subfixWidget,
        ),
      ),
    );
  }
}
