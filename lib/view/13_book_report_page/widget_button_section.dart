import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget buttonSection(){
  return Container(
    width: 245.w,
    height: 40.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _modifyOrSaveButton(),
      ],
    ),
  );
}

Widget _modifyOrSaveButton(){
  return Container(
    width: 107.w,
    height: 40.h,
    child: Get.find<HomePageViewController>().ifReadMode.value ?
      ElevatedButton(
        onPressed: (){
          Get.find<HomePageViewController>().changeMode();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
            side: BorderSide(color: Colors.black, width: 1.w),
          ),
        ),
        child: Text("수정하기", style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),),
      )
    : ElevatedButton(
      onPressed: (){
        Get.find<HomePageViewController>().saveBookReview().then((value) => {
          if(value) Get.find<HomePageViewController>().changeMode()
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
          side: BorderSide(color: Colors.black, width: 1.w),
        ),
      ),
      child: Text("저장하기", style: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),),
    )
  );
}