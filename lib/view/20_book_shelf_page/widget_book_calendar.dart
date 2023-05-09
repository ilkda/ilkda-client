import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:ilkda_client/model/calendar.dart";
import 'package:ilkda_client/view_model/book_shelf_page_viewcontroller.dart';

Widget bookCalendar(){
  return Container(
    width: 327.w,
    height: 359.h,
    child: Column(
      children: [
        _title(),
        SizedBox(height: 7.h,),
       _calendar(),
        SizedBox(height: 23.h,),
        _indicator(),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////title
Widget _title() => Container(
  width: 324.w,
  child: Text("독서 달력", style: TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  ),)
);


////////////////////////////////////////////////////////////////////////////////calendar
Widget _calendar() => Container(
  width: 307.w,
  height: 286.h,
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
      _calendarHeader(),
      Flexible(child: _calendarBody()),
    ],
  ),
);

Widget _calendarHeader() => Container(
  padding: EdgeInsets.symmetric(vertical: 7.h),
  child: Text(
    "${Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.thisMonth.year}년 ${Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.thisMonth.month}월",
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
);

Widget _calendarBody() => Container(
  padding: EdgeInsets.symmetric(horizontal: 13.w),
  child: Get.find<BookShelfPageViewController>().isCalendarNull()
    ? CircularProgressIndicator()
  : Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ _calendarBodyRow(
      [for(int i = 0; i < Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.firstWeekdayOfMonth; i++) CalendarElement.nullInit()]
        + Get.find<BookShelfPageViewController>().calendar.value.calendarElements.sublist(0, 7-Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.firstWeekdayOfMonth)
      )]
    + [
      for(int i = 7 - Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.firstWeekdayOfMonth;
              i <= Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.thisMonth.day;
              i += 7)
        (i + 7 > Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.thisMonth.day)
        ? _calendarBodyRow(Get.find<BookShelfPageViewController>().calendar.value.calendarElements.sublist(i) + [
          for(int j = 0; j < 7 - Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.thisMonth.weekday - 1; j++) CalendarElement.nullInit()])
        : _calendarBodyRow(Get.find<BookShelfPageViewController>().calendar.value.calendarElements.sublist(i, i + 7))
    ]
  )
);

Widget _calendarBodyRow(List<CalendarElement> calendarRow) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: calendarRow.map((e) => Container(
    width: 33.7.h,
    height: 33.7.h,
    margin: EdgeInsets.symmetric(vertical: 3.24.h),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: calendarElementColor[e.level],
    ),
  )).toList(),
);

const Map<int, Color> calendarElementColor = {
  -1 : Colors.transparent,
  0 : Color(0xFFEDEDED),
  1 : Color(0xFFFFD5DA),
  2 : Color(0xFFFF7A8A),
};

////////////////////////////////////////////////////////////////////////////////indicator
Widget _indicator() => Text(
  "이번 달은 "
  "${Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.thisMonth.day}"
  "일 중 "
  "${Get.find<BookShelfPageViewController>().calendar.value.calendarInfo.monthReadDateCount}"
  "일 읽었어요!",
  style: TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  ),
);