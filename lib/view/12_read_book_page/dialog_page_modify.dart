import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

class DialogPageModify extends StatelessWidget {
  const DialogPageModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _background(context),
          _dialog(context),
        ],
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////elements
Widget _background(BuildContext context) => Positioned(
  width: 360.w,
  height: 800.h,
  child: GestureDetector(
    onTap: (){
      Get.back();
    },
    child: Container(
      color: context.theme.colorScheme.surface.withOpacity(0.9),
    ),
  ),
);

Widget _dialog(BuildContext context) => Positioned(
  top: 233.h,
  child: Container(
    width: 340.w,
    height: 314.h,
    decoration: BoxDecoration(
      color: context.theme.colorScheme.background,
      borderRadius: BorderRadius.circular(32.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, -4), // changes position of shadow
        ),
      ],
    ),
    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 21.w),
    child: Column(
      children: [
        _closeButton(),
        SizedBox(height: 1.h,),
        _logo(),
        SizedBox(height: 27.h,),
        _pageModifyButton(),
        SizedBox(height: 16.h,),
        _saveButton(context)
      ],
    ),
  ),
);

Widget _closeButton() => Container(
  height: 22.h,
  alignment: Alignment.centerLeft,
  child: GestureDetector(
    onTap: (){
      Get.back();
    },
    child: Image.asset(
      "assets/icons/close.png",
      width: 22.h,
    ),
  ),
);

Widget _logo() => Container(
  width: 97.w,
  height: 111.h,
  child: Image.asset(
    "assets/images/logo.png",
  ),
);

Widget _pageModifyButton() => Container(
  width: 96.w,
  height: 43.h,
  child: Stack(
    alignment: Alignment.center,
    children: [
      _pageTextField(),
      _pageText(),
      _underline(),
    ],
  )
);

Widget _saveButton(BuildContext context) => GestureDetector(
  onTap: (){
    Get.find<HomePageViewController>().updateCurrentRecordPage().then(
        (value) {
          if(value == 200) {
            Get.back();
          }
          else{
          }
        }
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
    child: Text("저장하기", style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.0,
    ),),
  ),
);

////////////////////////////////////////////////////////////////////////////////page modify button elements
Widget _pageTextField() => Positioned(
  child: Container(
    width: 96.w,
    height: 43.h,
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: _outlineInputBorder,
        isCollapsed: true,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        disabledBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder,
        focusedErrorBorder: _outlineInputBorder,
        hintText: Get.find<HomePageViewController>().currentBookRecord.value.readPage.toString(),
        // hintStyle: TextStyle(
        //   fontSize: 30.sp,
        //   fontWeight: FontWeight.w400,
        // ),
        // helperText: "hey",
        helperStyle: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: Get.find<HomePageViewController>().pageModifyTextEditingController,
      // selectionHeightStyle: BoxHeightStyle.max,
    ),
  ),
);

Widget _pageText() => Positioned(
  right: 0,
  child: Text(
    "쪽",
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
);

Widget _underline() => Positioned(
  bottom: 0,
  child: Container(
    width: 96.w,
    height: 1.h,
    color: Colors.black,
  ),
);

////////////////////////////////////////////////////////////////////////////////content constants
const OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.transparent),
);