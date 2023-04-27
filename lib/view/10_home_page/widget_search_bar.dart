import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget searchBar(BuildContext context) => Container(
  width: 329.w,
  height: 28.h,
  padding: EdgeInsets.only(left: 10.w, right: 7.w),
  decoration: BoxDecoration(
    color: context.theme.colorScheme.background,
    borderRadius: BorderRadius.circular(12.r),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("검색어를 입력해주세요", style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.surface,
        fontWeight: FontWeight.w400,
        height: 1.0,
      ),),
      Image.asset(
        "assets/images/search.png",
        height: 17.39,
        color: context.theme.colorScheme.onSurface,
      ),
    ],
  ),
);