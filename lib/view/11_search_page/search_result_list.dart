import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget searchResultList(){
  return Container(
    width: 360.w,
    height: 633.h,
    alignment: Alignment.center,
    child : (Get.find<HomePageViewController>().searchBooksList.isEmpty) ?
    Text("검색 결과가 없습니다.")
    : SingleChildScrollView(
      child: Column(
        children: Get.find<HomePageViewController>().searchBooksList.map((book) => _listElement(book)).toList(),
      ),
    ),
  );
}

Widget _listElement(Book book){
  return GestureDetector(
    onTap: (){
      print("book id : ${book.id} sended!");
      Get.find<HomePageViewController>().registerBook(book.id);
    },
    child: Container(
      width: 317.w,
      height: 148.h,
      margin: EdgeInsets.only(top: 17.h),
      child: Row(
        children: [
          _bookImage(book),
          SizedBox(width: 13.w,),
          _contentColumn(book),
        ],
      ),
    ),
  );
}

Widget _bookImage(Book book){
  return Container(
    height: 148.h,
    width: 97.w,
    child: Image.network(book.cover),
  );
}

Widget _contentColumn(Book book){
  return Container(
    width: 204..w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(book.title, style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 12.sp,
        ),),
        SizedBox(height: 12.h,),
        Text("저자  " + book.author, style: TextStyle(
          fontSize: 10.sp,
        ),),
        SizedBox(height: 5.h,),
        Text("출판  " + book.publisher, style: TextStyle(
          fontSize: 10.sp,
        ),),
        SizedBox(height: 5.h,),
        Text("발행  " + book.publishedDate, style: TextStyle(
          fontSize: 10.sp,
        ),),
      ],
    ),
  );
}