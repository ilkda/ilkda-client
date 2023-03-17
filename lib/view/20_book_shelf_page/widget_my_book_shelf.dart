import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/view_model/book_shelf_page_viewcontroller.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget myBookShelf(){
  return Container(
    width: 323.64.w,
    height: 338.35.h,
    child: Column(
      children: [
        _title(),
        SizedBox(height: 8.18.h,),
        _bookShelf(),
      ],
    ),
  );
}

Widget _title() => Container(
    width: 324.w,
    height: 20.82.h,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 20.82.h,
          alignment: Alignment.center,
          child: Text("내 책장", style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),),
        ),
        SizedBox(width: 5.w,),
        SizedBox(
          width: 17.82.h,
          height: 17.82.h,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black, width: 0.5),
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            child: Icon(Icons.remove, size: 14.sp, color: Colors.black,),
          ),
        )
      ],
    )
);

Widget _bookShelf(){
  Get.find<HomePageViewController>().searchAladinBooks();
  return Container(
    width: 323.64.w,
    height: 309.35.h,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [for (var i = 0; i < Get.find<HomePageViewController>().aladinBooks.length; i += 3)
          Container(
            margin: EdgeInsets.only(bottom: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var j = 0; j < 3; j++)
                  Get.find<HomePageViewController>().aladinBooks.length <= i + j ?
                  Container(width: 92.w, height: 158.h,)
                  : _bookShelfElement(Get.find<HomePageViewController>().aladinBooks[i + j]),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _bookShelfElement(AladinBook book){
  return Container(
    width: 92.w,
    height: 160.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(book.cover, width: 92.w, height: 134.h,),
        Container(
          width: 92.w,
          height: 20.h,
          alignment: Alignment.topCenter,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: TextSpan(text: book.title, style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
              height: 1.0,
              color: Colors.black,
            ),),
          ),
        ),
      ],
    ),
  );
}