import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget textFieldSection() => Column(
  children: [
    _manuScript(),
    _ghostTextField(),
  ],
);

Widget _manuScript() => GestureDetector(
  onTap: Get.find<HomePageViewController>().ifReadMode.value
    ? null
    : () {
      if(Get.find<HomePageViewController>().bookReportFocusNode.hasFocus) {
        Get.find<HomePageViewController>().bookReportFocusNode.unfocus();
      } else {
        Get.find<HomePageViewController>().bookReportFocusNode.requestFocus();
      }
    },
  child: Container(
    width: 299.54.w,
    height: 691.h,
    // color: Colors.blue,
    child: SingleChildScrollView(
      child: Column(
        children : [_manuScriptRow("           ")]
        + [for (int i = 0; i < Get.find<HomePageViewController>().bookReportText.value.length / 11; i++) (_manuScriptRow(
            Get.find<HomePageViewController>().bookReportText.value.length - i * 11 < 11
            ? Get.find<HomePageViewController>().bookReportText.value.substring(11 * i)
            : Get.find<HomePageViewController>().bookReportText.value.substring(11 * i, 11 * i + 11)
          ))]
        + [for (int i = 0; i < 17 - Get.find<HomePageViewController>().bookReportText.value.length / 11; i++) (_manuScriptRow(""))]
        + [_manuScriptRow("           ")]
        + [SizedBox(height: 106.h)],
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
    + [for (int i = 0; i < text.length; i++) (
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
    )]
    + [for (int i = 0; i < 11 - text.length; i++) (
        Container(
          width: 22.94.w,
          height: 22.94.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.26.w,
            ),
          ),
        )
      )]
    + [ Container(
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
    controller: Get.find<HomePageViewController>().bookReportController,
    onChanged: (value){
      Get.find<HomePageViewController>().updateBookReportText(value);
    },
  )
);