import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget buttonSection(BuildContext context){
  return Positioned(
    bottom: 0,
    child: Container(
      width: 360.w,
      height: 106.h,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 3,
            color: context.theme.colorScheme.outline.withOpacity(0.3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 55.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Get.find<HomePageViewController>().ifReadMode.value
        ? [
          _modifyButton(context),
          _goBackButton(context),
        ]
        : [
          _saveButton(context),
          _undoButton(context),
        ],
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////// Read Mode
Widget _modifyButton(BuildContext context){
  return Container(
    width: 107.w,
    height: 40.h,
    child: ElevatedButton(
      onPressed: (){
        Get.find<HomePageViewController>().toWriteMode();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
        elevation: 5,
      ),
      child: Text("수정하기", style: TextStyle(
        fontSize: 14.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w400,
      ),),
    )
  );
}

Widget _goBackButton(BuildContext context){
  return Container(
    width: 107.w,
    height: 40.h,
    child: ElevatedButton(
      onPressed: (){
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
        elevation: 5,
      ),
      child: Text("돌아가기", style: TextStyle(
        fontSize: 14.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w400,
      ),),
    )
  );
}

//////////////////////////////////////////////////////////////////////////////// Write Mode
Widget _saveButton(BuildContext context){
  return Container(
    width: 107.w,
    height: 40.h,
    child: ElevatedButton(
      onPressed: (){
        Get.find<HomePageViewController>().saveBookReview();
        Get.find<HomePageViewController>().toReadMode();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
        elevation: 5,
      ),
      child: Text("저장하기", style: TextStyle(
        fontSize: 14.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w400,
      ),),
    )
  );
}

Widget _undoButton(BuildContext context){
  return Container(
      width: 107.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: (){
          Get.find<HomePageViewController>().rollBackBookReview();
          Get.find<HomePageViewController>().toReadMode();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: context.theme.colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
          ),
          elevation: 5,
        ),
        child: Text("취소", style: TextStyle(
          fontSize: 14.sp,
          color: context.theme.colorScheme.outline,
          fontWeight: FontWeight.w400,
        ),),
      )
  );
}