import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget homePageNewBookList() => Container(
  width: 327.w,
  height: 165.32.h,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("신간 리스트", style: TextStyle(
        fontSize: 14.sp,
      ),),
      _newBookListFromAladin(),
    ],
  ),
);

Widget _newBookListFromAladin() => Container(
  width: 327.w,
  height: 139.19.h,
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.05),
    borderRadius: BorderRadius.circular(12.39.r),
  ),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
     children: Get.find<HomePageViewController>().aladinBooks.map((e) => _BookWidget(e)).toList()
    ),
  ),
);

Widget _BookWidget(AladinBook book) => Container(
  height: 98.h,
  margin: EdgeInsets.symmetric(horizontal: 6.w),
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.35),
        spreadRadius: 2,
        blurRadius: 4,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  ),
  child: Image.network(book.cover)
);