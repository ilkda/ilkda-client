import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/model/record.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget bookSection(BuildContext context, Record record) {
  return Container(
    width: 258.w,
    height: 553.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _bookImage(record.book.cover),
        _bookInfo(context, record),
        SizedBox(height: 15.h,),
        _bookRecordButton(context, record.review),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////elements

////Image
Widget _bookImage(String cover) => Container(
  height: 400.h,
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
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(6.r),
    child: Image.network(
      cover,
      fit: BoxFit.cover,
    ),
  ),
);

////Info
Widget _bookInfo(BuildContext context, Record record){
  return Column(
    children: [
      _bookTitle(context, record.book.title),
      SizedBox(width: 8.h,),
      _bookAuthor(context, record.book.author),
      _bookPage(context, record.book.page),
    ],
  );
}

Widget _bookTitle(BuildContext context, String title) => Container(
  width: 193.w,
  child: Text(
    title,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      color: context.theme.colorScheme.outline,
    ),
  ),
);

Widget _bookAuthor(BuildContext context, String author) => Container(
  child: Text(
    author,
    style: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w300,
      overflow: TextOverflow.ellipsis,
      color: context.theme.colorScheme.outline,
    ),
  ),
);

Widget _bookPage(BuildContext context, int page) => Container(
  child: Text(
    "$page쪽",
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: context.theme.colorScheme.outline,
    ),
  ),
);

////Record
Widget _bookRecordButton(BuildContext context, String review) => GestureDetector(
  onTap : (){
    Get.toNamed(
      "/BookShelf/ViewBookReview",
      arguments: {"review": review},
    );
  },
  child: Container(
    width: 107.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: context.theme.colorScheme.background,
      borderRadius: BorderRadius.circular(11.r),
      boxShadow: [
        BoxShadow(
          color: context.theme.colorScheme.outline.withOpacity(0.5),
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(2, 2),
        ),
      ],
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/pencil.png", width: 14.w, height: 14.h,),
        Text("감상 기록", style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),),
      ],
    ),
  ),
);