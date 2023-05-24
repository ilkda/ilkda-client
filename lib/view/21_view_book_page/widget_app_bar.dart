import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget appBarViewBookPage(BuildContext context) => Container(
  height: 16.59.h,
  width: 360.w,
  alignment: Alignment.centerLeft,
  padding: EdgeInsets.symmetric(horizontal: 42.w),
  child: _backArrow(context),
);

////////////////////////////////////////////////////////////////////////////////elements

Widget _backArrow(BuildContext context) => GestureDetector(
  onTap: (){
    Get.back();
  },
  child: Image.asset(
    "assets/icons/back.png",
    height: 15.41.h,
    color: context.theme.colorScheme.outline,
  ),
);