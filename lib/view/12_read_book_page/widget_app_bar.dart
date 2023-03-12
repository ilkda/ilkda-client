import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget appBarReadBookPage() => Container(
  height: 55.h,
  width: 360.w,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: 42.w,),
      _backArrow(),
    ],
  ),
);

////////////////////////////////////////////////////////////////////////////////elements

Widget _backArrow() => GestureDetector(
  onTap: (){
    Get.find<HomePageViewController>().searchCurrentRecordList();
    Get.toNamed("/Home");
  },
  child: Icon(
    Icons.arrow_back_ios_sharp,
    size: Size(9.w, 16.h).longestSide,
  ),
);