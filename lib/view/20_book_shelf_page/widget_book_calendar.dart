import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:ilkda_client/view_model/book_shelf_page_viewcontroller.dart';

Widget bookCalendar(){
  return Container(
    width: 324.w,
    height: 351.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title(),
        _calendar(),
        _indicator(),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////title
Widget _title() => Container(
  width: 324.w,
  child: Text("독서 달력", style: TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  ),)
);


////////////////////////////////////////////////////////////////////////////////calendar
Widget _calendar() => Container(
  width: 257.9.w,
  height: 285.58.h,
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        spreadRadius: 0,
        blurRadius: 4,
        offset: Offset(0, 4), // changes position of shadow
      ),
    ],
  ),
  child: Column(
    children: [
      SizedBox(height: 12.h,),
      _calendarHeader(),
      _calendarBody(),
    ],
  ),
);

Widget _calendarHeader() => Text(
  "${Get.find<BookShelfPageViewController>().year}년 ${Get.find<BookShelfPageViewController>().month}월",
  style: TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  ),
);

Widget _calendarBody() => Container(
  width: 231.27.w,
  height: 257.92.h,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    // children: Get.find<BookShelfPageViewController>().calendar.value.calendarElements.map((e) => _calendarBodyRow(e.level)).toList(),
  )
);

Widget _calendarBodyRow(List<int> calendarRow) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: calendarRow.map((e) => Container(
    width: 28.37.h,
    height: 28.37.h,
    margin: EdgeInsets.symmetric(vertical: 6.54.h),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: calendarElementColor[e],
    ),
  )).toList(),
);

const Map<int, Color> calendarElementColor = {
  -1 : Colors.transparent,
  0 : Color(0xFFEDEDED),
  1 : Color(0xFFA6A6A6),
  2 : Color(0xFF202020),
};

////////////////////////////////////////////////////////////////////////////////indicator
Widget _indicator() => Text(
  "이번 달은 28일 중 14일 읽었어요!",
  style: TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  ),
);