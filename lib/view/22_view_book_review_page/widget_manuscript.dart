import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget manuScript(String review) => GestureDetector(
  child: Container(
    width: 299.54.w,
    height: 691.h,
    // color: Colors.blue,
    child: SingleChildScrollView(
      child: Column(
        children : [_manuScriptRow("           ")]
        + [for (int i = 0; i < review.length / 11; i++) (_manuScriptRow(
            review.length - i * 11 < 11
            ? review.substring(11 * i)
            : review.substring(11 * i, 11 * i + 11)
          ))]
        + [for (int i = 0; i < 17 - review.length / 11; i++) (_manuScriptRow(""))]
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