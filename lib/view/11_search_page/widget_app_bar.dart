import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget appBarSearchPage() => Container(
  height: 55.h,
  width: 360.w,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _backArrow(),
      SizedBox(width: 22.w,),
      _serachBarSection(),
      SizedBox(width: 12.w),
      _searchButton()
    ],
  ),
);

////////////////////////////////////////////////////////////////////////////////elements

Widget _backArrow() => GestureDetector(
  onTap: (){
    Get.back();
  },
  child: Icon(
    Icons.arrow_back_ios_sharp,
    size: Size(9.w, 16.h).longestSide,
  ),
);

Widget _serachBarSection() => Container(
  height: 23.h,
  width: 251.w,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Color(0xFFF2F2F2),
    borderRadius: BorderRadius.circular(8.5.r),
  ),
  padding: EdgeInsets.all(0),
  child: TextField(
    textAlignVertical: TextAlignVertical.center,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(11),
      hintText: "검색어를 입력하세요",
      enabledBorder: _transparentBorder(),
      focusedBorder: _transparentBorder(),
      hintStyle: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xFF9E9E9E),
      ),
    ),
    style: TextStyle(
      fontSize: 12.sp,
      color: Colors.black,
    ),
    controller: Get.find<HomePageViewController>().searchController,
    autofocus: true,
    onSubmitted: (value) {
      Get.find<HomePageViewController>().searchBookList();
    },
  ),
);

Widget _searchButton() => GestureDetector(
  onTap: (){
    Get.find<HomePageViewController>().searchBookList();
  },
  child: Image.asset("assets/images/search.png", width: 14.91.w,),
);

////////////////////////////////////////////////////////////////////////////////Inner Constants
InputBorder _transparentBorder() => const UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);