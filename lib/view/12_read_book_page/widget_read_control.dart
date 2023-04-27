import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/12_read_book_page/dialog_page_modify.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget readControl(BuildContext context){
  return Positioned(
    top: 658.h,
    width: 249.w,
    height: 40.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _recordButton(context),
        _readEndButton(context),
      ],
    ),
  );
}


Widget _recordButton(BuildContext context) => GestureDetector(
  onTap : (){
    Get.toNamed("/Home/BookReport");
  },
  child: Container(
    width: 107.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: context.theme.colorScheme.background,
      borderRadius: BorderRadius.circular(11.r),
      boxShadow: [
        BoxShadow(
          color: context.theme.colorScheme.outline.withOpacity(0.5),
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(2, 2),
        ),
      ],
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/pencil.png", width: 14.w, height: 14.h,),
        Text("감상 기록", style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),),
      ],
    ),
  ),
);

Widget _readEndButton(BuildContext context) => GestureDetector(
  onTap: (){
    Get
      .find<HomePageViewController>()
      .finishCurrentBook()
      .then(
        (value){ if(value) {
          Get.toNamed("/Home");
      }});
  },
  child: Container(
    width: 107.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: context.theme.colorScheme.background,
      borderRadius: BorderRadius.circular(11.r),
      boxShadow: [
        BoxShadow(
          color: context.theme.colorScheme.outline.withOpacity(0.5),
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(2, 2),
        ),
      ],
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/book.png", width: 14.w, height: 14.h,),
        Text("읽기 시작", style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),),
      ],
    ),
  ),
);