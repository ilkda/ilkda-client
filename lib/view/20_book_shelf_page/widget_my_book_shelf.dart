import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/view_model/book_shelf_page_viewcontroller.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget myBookShelf(BuildContext context){
  return Container(
    width: 360.w,
    // height: 344.h,
    child: Column(
      children: [
        _title(context),
        SizedBox(height: 8.18.h,),
        _bookShelf(),
      ],
    ),
  );
}

Widget _title(BuildContext context) => Container(
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
              backgroundColor: context.theme.colorScheme.background,
              side: BorderSide(color: context.theme.colorScheme.outline, width: 0.5),
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            child: Icon(Icons.remove, size: 14.sp, color: context.theme.colorScheme.outline,),
          ),
        )
      ],
    )
);

Widget _bookShelf(){
  Get.find<HomePageViewController>().searchAladinBooks();
  return Container(
    width: 360.w,
    height: 315.h,
    padding: EdgeInsets.symmetric(horizontal: 13.5),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var i = 0; i < Get.find<BookShelfPageViewController>().myRecordList.length; i += 3)
            (i + 3 < Get.find<BookShelfPageViewController>().myRecordList.length)
            ? _bookShelfRow(Get.find<BookShelfPageViewController>().myRecordList.sublist(i, i + 3).map((e) => e.book).toList())
            : _bookShelfRow(
                Get.find<BookShelfPageViewController>().myRecordList.sublist(i).map((e) => e.book).toList()
                + [for(int i = 0; i < 3 - Get.find<BookShelfPageViewController>().myRecordList.length - i; i++) Book.nullInit()]
            )
        ] + [SizedBox(height: 64.h + 3.h,)],
      ),
    ),
  );
}

Widget _bookShelfRow(List<Book> bookList){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: bookList.map((e){
      return e.ifBookNull()
      ? _emptyBookShelfElement()
      : _bookShelfElement(e);
    }).toList(),
  );
}

Widget _bookShelfElement(Book book){
  return Container(
    width: 90.w,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: Image.network(book.cover, fit: BoxFit.fill)
        ),
        SizedBox(height: 7.36.h,),
        Text(book.title, style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis
        ),),
      ],
    ),
  );
}

Widget _emptyBookShelfElement(){
  return Container(
    width: 92.w,
    height: 160.h,
  );
}