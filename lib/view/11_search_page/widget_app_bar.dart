import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget appBarSearchPage(BuildContext context) => Container(
  height: 28.h,
  width: 329.w,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _backArrow(),
      SizedBox(width: 14.4.w,),
      _serachBarSection(context),
    ],
  ),
);

////////////////////////////////////////////////////////////////////////////////elements

Widget _backArrow() => GestureDetector(
  onTap: (){
    Get.back();
  },
  child: Image.asset(
    "assets/icons/back.png",
    width: 10.6,
  ),
);

Widget _serachBarSection(BuildContext context) => Container(
  height: 28.h,
  width: 304.w,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: context.theme.colorScheme.onPrimary,
    borderRadius: BorderRadius.circular(12.r),
  ),
  padding: EdgeInsets.only(left: 9.w, right: 7.w),
  child: Row(
    children: [
      _searchSection(context),
      _searchButton(),
    ],
  ),
);

Widget _searchSection(BuildContext context) => Container(
  width: 271.w,
  child: TextField(
    textAlignVertical: TextAlignVertical.center,
    cursorColor: context.theme.colorScheme.outline,
    cursorWidth: 1.w,
    cursorHeight: 17.h,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(11),
      hintText: "검색어를 입력하세요",
      enabledBorder: _transparentBorder(),
      focusedBorder: _transparentBorder(),
      hintStyle: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.surface,
      ),
    ),
    style: TextStyle(
      fontSize: 12.sp,
      color: context.theme.colorScheme.outline,
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
  child: Image.asset("assets/icons/search.png", height: 14.91.h,),
);

////////////////////////////////////////////////////////////////////////////////Inner Constants
InputBorder _transparentBorder() => const UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);