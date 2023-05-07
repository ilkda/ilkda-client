import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

import 'widget_button_section.dart';
import 'widget_text_field_section.dart';

class BookReportPage extends StatelessWidget {
  const BookReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: 360.w,
            height: 800.h,
            child: Column(
              children: [
                SizedBox(height: 70.h,),
                _title(context),
                SizedBox(height: 16.h,),
                textFieldSection(),
              ],
            )
          ),
          buttonSection(context),
        ],
      )
    ));
  }
}

Widget _title(BuildContext context) => Container(
  width: 298.w,
  height: 23.h,
  child: Row(
    children: [
      GestureDetector(
        onTap: (){
          Get.find<HomePageViewController>().toReadMode();
          Get.back();
        },
        child: Image.asset(
          "assets/icons/back.png",
          height: 20.91.h,
        )
      ),
      SizedBox(width: 10.4.w,),
      Text("감상 기록", style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: context.theme.colorScheme.outline,
        height: 1.0,
      ),),
    ],
  ),
);
