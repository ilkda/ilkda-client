import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget appBarHomePage(BuildContext context) => Container(
  width: 323.04,
  height: 35.h,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        "assets/images/logo.png",
        height: 22.91.h,
      ),
      SizedBox(width: 5.w),
      Text("읽다", style: TextStyle(
        fontSize: 24.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w500,
        height: 1.0,
      ),)
    ],
  ),
);
