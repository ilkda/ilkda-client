import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/model/record.dart';
import 'package:ilkda_client/view/12_read_book_page/read_book_page.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget homePageMyBookList(BuildContext context){
  return Container(
    width: 360.w,
    height: 370.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 205.w),
          child: Text("지금 책을 읽어보세요", style: TextStyle(
            fontSize: 14.sp,
            color: context.theme.colorScheme.outline.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),),
        ),
        _myBookList(),
        Get.find<HomePageViewController>().currentRecordIndex.value == Get.find<HomePageViewController>().currentRecordList.length - 1 ? Container(height: 32.h,)
        : _content(
          context,
          Get.find<HomePageViewController>().currentBookRecord.value.book.title,
          Get.find<HomePageViewController>().currentBookRecord.value.book.author
        ),
        Get.find<HomePageViewController>().currentRecordIndex.value == Get.find<HomePageViewController>().currentRecordList.length - 1 ? Container(height: 14.h,)
        : _pageIndicator(
          context,
          (100 * Get.find<HomePageViewController>().currentBookRecord.value.readPage / Get.find<HomePageViewController>().currentBookRecord.value.book.page).toInt(),
        ),
      ],
    ),
  );
}

Widget _myBookList() => Container(
  width: 360.w,
  height: 297.h,
  child:  Stack(
    children:[
      AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        width: (186.w * Get.find<HomePageViewController>().currentRecordList.length),
        left: -1 * (
            (186.w * (Get.find<HomePageViewController>().currentRecordIndex.value - 1) )
            + 99.w
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List<Widget>.from(Get.find<HomePageViewController>().currentRecordList.map((element) {
            return AnimatedScale(
              scale: Get.find<HomePageViewController>().currentRecordIndex.value ==
              Get.find<HomePageViewController>().currentRecordList.indexOf(element) ? 1 : 0.8,
              duration: Duration(milliseconds: 200),
              child: Record.isNull(element) ? _emptyBook(): _book(element),
            );
          })),
        )
      ),

      Positioned(
          left: 0,
          child: GestureDetector(
            onTap: (){
              print(Get.find<HomePageViewController>().currentRecordList.length);
              Get.find<HomePageViewController>().decreaseRecordIndex();
            },
            onVerticalDragEnd: (value){
              Get.find<HomePageViewController>().decreaseRecordIndex();
            },
            child: Container(
              width: 70.w,
              height: 340.h,
              color: Colors.transparent,
            ),
          )
      ),
      Positioned(
          right: 0,
          child: GestureDetector(
            onTap: (){
              Get.find<HomePageViewController>().increaseRecordIndex();
            },
            onVerticalDragEnd: (value){
              Get.find<HomePageViewController>().increaseRecordIndex();
            },
            child: Container(
              width: 70.w,
              height: 340.h,
              color: Colors.transparent,
            ),
          )
      ),

    ],
  ),
);

Widget _book(Record currentRecord) => GestureDetector(
  onTap: (){
    if(Get.find<HomePageViewController>().updateCurrentBookRecord(currentRecord) == true) {
      Get.to(() => ReadBookPage(), transition: Transition.downToUp, opaque: false);
    }
  },
  child: Container(
    alignment: Alignment.center,
    width: 178.w,
    height: 280.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(5, 5), // changes position of shadow
        ),
      ],
      image: DecorationImage(
        image: NetworkImage(currentRecord.book.cover),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

Widget _emptyBook() => ElevatedButton(
  onPressed: (){},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    fixedSize: Size(186.w, 292.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
  ),
  child: Icon(Icons.add, color: Colors.black,),
);

Widget _content(BuildContext context, String title, String author) => Container(
  height: 32.h,
  width: 178.w,
  child: Column(
    children: [
      Text(title, style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w400,
        height: 1.0,
        overflow: TextOverflow.ellipsis,
      ),),
      SizedBox(height: 1.h,),
      Text(author, style: TextStyle(
        fontSize: 10.sp,
        color: context.theme.colorScheme.onSurface,
        fontWeight: FontWeight.w300,
        height: 1.0,
        overflow: TextOverflow.ellipsis,
      ),),
    ],
  ),
);

Widget _pageIndicator(BuildContext context, int percentage) => Container(
  width: 279.w,
  height: 14.h,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 251.w,
        height: 8.h,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 100 - percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.onPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 21.w,
        alignment: Alignment.centerRight,
        child: Text(percentage.toString() + "%", style: TextStyle(
          fontSize: 10.sp,
          color: context.theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
          height: 1.0,
        ),),
      ),
    ],
  ),
);