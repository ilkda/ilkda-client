import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget bookSection() {
  return Container(
    width: 275.w,
    height: 479.h,
    child: Column(
      children: [
        _bookImage(),
        _bookTitle(),
        SizedBox(height: 15.h),
        _bookAuthor(),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////elements
Widget _bookImage() => Container(
  height: 433.76.h,
  child: Image.network(
    Get.find<HomePageViewController>().currentBookRecord.value.book.cover,
  ),
);

Widget _bookTitle() => Container(
  width: 193.w,
  child: Text(
    Get.find<HomePageViewController>().currentBookRecord.value.book.title,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);

Widget _bookAuthor() => Container(
  child: Text(
    Get.find<HomePageViewController>().currentBookRecord.value.book.author,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
    ),
  ),
);