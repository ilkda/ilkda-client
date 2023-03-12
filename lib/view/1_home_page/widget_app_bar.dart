import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget appBarHomePage() => Container(
  height: 55.h,
  width: 360.w,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _logoSection(),
      SizedBox(width: 5.w,),
      _serachBarSection(),
      SizedBox(width: 12.w),
      _searchButton()
    ],
  ),
);

////////////////////////////////////////////////////////////////////////////////elements

Widget _logoSection() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset(
      "assets/images/logo.png",
      width: 13.w,
    ),
    SizedBox(width: 3.w),
    Text("읽다", style: TextStyle(
      fontSize: 14.sp
    ),)
  ],
);

Widget _serachBarSection() => GestureDetector(
  onTap: (){
    Get.toNamed("/Home/Search");
  },
  child: Container(
    height: 23.h,
    width: 251.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color(0xFFF2F2F2),
      borderRadius: BorderRadius.circular(8.5.r),
    ),
    padding: EdgeInsets.all(0),
  ),
);

Widget _searchButton() => Container(
  child: Image.asset("assets/images/search.png", width: 14.91.w,),
);

////////////////////////////////////////////////////////////////////////////////Inner Constants
InputBorder _transparentBorder() => const UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);