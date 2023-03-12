import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget_button_section.dart';
import 'widget_text_field_section.dart';

class BookReportPage extends StatelessWidget {
  const BookReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 38.h,),
          _title(),
          SizedBox(height: 30.48.h,),
          textFieldSection(),
          SizedBox(height: 72.06.h,),
          _divider(),
          SizedBox(height: 25.h,),
          buttonSection(),
        ],
      )
    ));
  }
}

Widget _title() => Container(
  width: 299.54.w,
  height: 20.h,
  alignment: Alignment.centerLeft,
  child: Row(
    children: [
      SizedBox(width: 10.w,),
      GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios, size: 20.sp,),
      ),
      SizedBox(width: 13.19.w,),
      Text("감상 기록", style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold
      ),),
    ],
  ),
);

Widget _divider() => Container(
  width: 360.w,
  height: 6.h,
  color: Color(0xffd9d9d9),
);
