import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/model/record.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget homePageMyBookList(){
  return Container(
    width: 334.w,
    height: 240.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("지금 책을 읽어보세요", style: TextStyle(
          fontSize: 14.sp,
        ),),
        SizedBox(height: 9.h,),
        _myBookList(),
      ],
    ),
  );
}

Widget _myBookList() => Container(
  width: 334.w,
  height: 211.h,
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.05),
    borderRadius: BorderRadius.circular(24.r),
  ),
  child: RotatedBox(
    quarterTurns: -1,
    child: GestureDetector(
      onTap: (){

        if(Get.find<HomePageViewController>().currentRecordList.isNotEmpty
            && Get.find<HomePageViewController>().updateCurrentBookRecord_fromIndex()) {
          Get.toNamed("/Home/ReadBook");
        }
      },
      child: ListWheelScrollView(
        itemExtent: 120.w,
        onSelectedItemChanged: (index) {
          Get.find<HomePageViewController>().currentRecordIndex(index);
        },
        children: Get.find<HomePageViewController>()
            .currentRecordList
            .map(
              (e) => RotatedBox(
                quarterTurns: 1,
                child: _book(e),
              )
        ).toList(),
      ),
    ),
  )
);

Widget _book(Record bookRecord) => Container(
  alignment: Alignment.center,
  width: 300.w,
  child: Image.network(bookRecord.book.cover),
);