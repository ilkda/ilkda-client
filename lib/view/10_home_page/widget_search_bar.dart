import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget searchBar(BuildContext context) => Container(
  width: 329.w,
  height: 28.h,
  padding: EdgeInsets.only(left: 10.w, right: 7.w),
  decoration: BoxDecoration(
    color: context.theme.colorScheme.onPrimary,
    borderRadius: BorderRadius.circular(12.r),
  ),
  child: GestureDetector(
    onTap: (){
      Get.toNamed("/Home/Search");
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("검색어를 입력하세요", style: TextStyle(
          fontSize: 12.sp,
          color: context.theme.colorScheme.surface,
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),),
        Image.asset(
          "assets/icons/search.png",
          height: 17.39,
        ),
      ],
    ),
  ),
);