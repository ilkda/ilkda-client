import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget homePageNewBookList(BuildContext context) => Container(
  width: 360.w,
  height: 194.h + 22.h,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 18.w),
        child: Text("신간 리스트", style: TextStyle(
          fontSize: 16.sp,
          color: context.theme.colorScheme.outline,
          fontWeight: FontWeight.w500,
          height: 1.0,
        ),),
      ),
      SizedBox(height: 12.h,),
      _newBookListFromAladin(),
    ],
  ),
);

Widget _newBookListFromAladin() => Container(
  width: 360.w,
  height: 158.h + 22.h,
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Get.find<HomePageViewController>().aladinBooks.map((e) => _BookWidget(e)).toList()
    ),
  ),
);

Widget _BookWidget(AladinBook book) => Container(
  height: 158.h,
  margin: EdgeInsets.only(left: 19.w),
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.35),
        spreadRadius: 1,
        blurRadius: 4,
        offset: Offset(3, 3), // changes position of shadow
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(6.r),
    child: Image.network(
      book.cover,
      fit: BoxFit.cover
    )
  )
);