import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget book() {
  return Positioned(
    top: 69.h,
    child: Container(
      width: 220.w,
      height: 346.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            Get.find<HomePageViewController>().currentBookRecord.value.book.cover,
          ),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}