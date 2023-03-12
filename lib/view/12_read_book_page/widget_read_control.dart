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
        _pageSection(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _recordButton(),
            _readEndButton(),
          ],
        )
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////elements
Widget _pageSection(BuildContext context) => Container(
  height: 22.h,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("${Get.find<HomePageViewController>().currentBookRecord.value.book.page}"
          "쪽 중에 "
          "${Get.find<HomePageViewController>().currentBookRecord.value.readPage}"
          "쪽 읽었어요!", style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),),
      GestureDetector(
        onTap: (){
          Get.dialog(dialogPageModify(context));
        },
        child: Container(
          width: 22.h,
          height: 22.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: Colors.black, width: 1.w),
          ),
          padding: EdgeInsets.all(4.h),
          child: Image.asset("assets/images/pencil.png"),
        ),
      ),
    ],
  ),
);

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

Widget _readEndButton() => GestureDetector(
  onTap: (){
    Get
      .find<HomePageViewController>()
      .finishCurrentBook()
      .then(
        (value){ if(value) {
          Get.toNamed("/Home");
      }});
  },
  child:   Container(
    width: 107.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.r),
      border: Border.all(color: Colors.black, width: 1.w),
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.all(4.h),
    child: Text("읽기 마침", style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),),
  ),
);