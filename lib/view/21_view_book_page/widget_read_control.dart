import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/12_read_book_page/dialog_page_modify.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget readControlSection(BuildContext context){
  return Container(
    width: 240.w,
    height: 94.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _recordButton()
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////elements

Widget _recordButton() => GestureDetector(
  onTap : (){
    Get.toNamed("/Home/BookReport");
  },
  child: Container(
    width: 107.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.r),
      border: Border.all(color: Colors.black, width: 1.w),
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.all(4.h),
    child: Text("감상 기록", style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),),
  ),
);