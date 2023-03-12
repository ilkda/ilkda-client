import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget textFieldSection() => Container(
  width: 299.54.w,
  height: 534.46.h,
  child: Column(
    children: [
      _manuScript(),
      _ghostTextField(),
    ],
  ),
);

Widget _manuScript() => GestureDetector(
  onTap: (){
    print("manuScript");
    Get.find<HomePageViewController>().bookReportFocusNode.requestFocus();
  },
  child: Container(
    width: 299.54.w,
    height: 534.46.h,
    child: SingleChildScrollView(
      child: Column(
        children : [_manuScriptRow("           ")]
        + [for (int i = 0; i < Get.find<HomePageViewController>().bookReportText.value.length; i += 11) (_manuScriptRow(
              Get.find<HomePageViewController>().bookReportText.value.substring(i, i + 11)
            ))]
        + [_manuScriptRow("           ")],
      ),
    ),
  ),
);

Widget _manuScriptRow(String text) => Container(
  margin: EdgeInsets.only(bottom: 5.6.w),
  child: Row(
    children: [ Container(
      width: 22.94.w,
      height: 22.94.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.26.w,
        ),
      ),
    )]
    + [for (int i = 0; i < 11; i++) (
      Container(
        width: 22.94.w,
        height: 22.94.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.26.w,
          ),
        ),
        child: Text(
          text[i],
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
      )
    )] +
    [ Container(
      width: 22.94.w,
      height: 22.94.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.26.w,
        ),
      ),
    )],
  ),
);

Widget _ghostTextField() => Container(
  width: 0,
  height: 0,
  child: TextField(
    focusNode: Get.find<HomePageViewController>().bookReportFocusNode,
    onChanged: (value){
      Get.find<HomePageViewController>().updateBookReportText(value);
    },
  )
);