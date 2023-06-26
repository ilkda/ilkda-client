import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget userNameSet(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("닉네임", style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),),
      SizedBox(height: 17.h,),
      Container(
        width: 307.w,
        height: 28.h,
        child: TextField(
          decoration: InputDecoration(
            hintText: "닉네임을 입력하세요.",
            hintStyle: TextStyle(
              fontWeight: FontWeight.w300,
              color: Get.context!.theme.colorScheme.tertiary,
              fontSize: 14.sp,
            ),
            contentPadding: EdgeInsets.only(left: 13.w),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Get.context!.theme.colorScheme.onSurface,
              ),
            ),

            suffixIcon: GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Image.asset(
                  "assets/icons/close.png",
                  color: Get.context!.theme.colorScheme.onSurface,
                ),
              ),
              onTap: (){},
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 11.h,
            ),
          ),
        ),
      ),
    ],
  );
}

