import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilkda_client/view_model/club_page_viewcontroller.dart';

Widget clubNameSection(BuildContext context){
  return Container(
    width: 307.w,
    height: 77.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context.theme.colorScheme.outline),
        _textField(context),
      ],
    ),
  );
}

Widget _title(Color textColor){
  return Text("모임 이름", style: TextStyle(
    color: textColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 1,
  ),);
}

Widget _textField(BuildContext context){
  return SizedBox(
    height: 47.h,
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      controller: Get.find<ClubPageViewController>().clubNameController,
      style: TextStyle(
        color: context.theme.colorScheme.outline,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1,
      ),
      decoration: InputDecoration(
        hintText: "모임 이름을 입력하세요.",
        hintStyle: TextStyle(
          color: context.theme.colorScheme.tertiary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 1,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: context.theme.colorScheme.onSurface,
            width: 0.4.w,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 0.4.w,
          ),
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        isDense: true,

        suffixIcon: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Image.asset("assets/icons/close.png"),
          ),
          onTap: (){},
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 8.h,
        ),

      ),
    ),
  );
}