import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/model/record.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget homePageMyBookList(){
  return Container(
    width: 360.w,
    height: 369.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Text("지금 책을 읽어보세요", style: TextStyle(
            fontSize: 14.sp,
          ),),
        ),
        _myBookList(),
        _content(Get.find<HomePageViewController>().currentRecordList[Get.find<HomePageViewController>().currentRecordIndex.value]),
      ],
    ),
  );
}

Widget _myBookList() => Container(
  width: 360.w,
  height: 292.h,
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
      Get.toNamed("/Home/ReadBook");
    }
  },
  child: Container(
    alignment: Alignment.center,
    width: 186.w,
    height: 292.h,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(4, 4), // changes position of shadow
        ),
      ],
    ),
    child: Image.network(currentRecord.book.cover),
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

Widget _content(Record bookRecord) => Container(
  height: 59.h,
  width: 360.w,
  child: Column(
    children: [
      Text(bookRecord.book.title, style: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),),
      Text(bookRecord.book.author, style: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),),
      SizedBox(height: 10.h,),
      Text(bookRecord.readPage.toString() + "쪽까지 읽었어요!", style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),),
    ],
  ),
);