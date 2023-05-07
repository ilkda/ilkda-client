import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/model/record.dart';
import 'package:ilkda_client/view/12_read_book_page/read_book_page.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget searchResultList(){
  return Container(
    width: 360.w,
    height: 657.h,
    alignment: Alignment.topCenter,
    child : (Get.find<HomePageViewController>().ifSearchResultEmpty.value) ?
    Container(
      width: 360.w,
      height: 657.h,
      alignment: Alignment.center,
      child: Text("검색 결과가 없습니다."),
    )
    : SingleChildScrollView(
      child: Column(
        children:
          Get.find<HomePageViewController>().searchBooksList.map((book) => _listElement(book)).toList()
          + [SizedBox(height: 65.h + 13.h,)],
      ),
    ),
  );
}

Widget _listElement(Book book){
  return GestureDetector(
    onTap: (){
      Get.find<HomePageViewController>().registerBook(book.id).then(
        (value) {
          if(value != -1){
            if(Get.find<HomePageViewController>().updateCurrentBookRecord(Record(
              book: book,
              readId: value,
              readPage : 0,
              review: "",
            )) == true) {
              Get.to(() => ReadBookPage(), transition: Transition.downToUp, opaque: false);
            }
          }
        });
    },
    child: Container(
      width: 317.w,
      margin: EdgeInsets.only(top: 13.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
    width: 97.w,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: Image.network(book.cover)
    ),
  );
}

Widget _contentColumn(Book book){
  return Container(
    width: 204.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(book.title, style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 12.sp,
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),),
        SizedBox(height: 12.h,),
        Text("저자  " + book.author, style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),),
        SizedBox(height: 5.h,),
        Text("출판  " + book.publisher, style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),),
        SizedBox(height: 5.h,),
        Text("발행  " + book.publishedDate, style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),),
      ],
    ),
  );
}