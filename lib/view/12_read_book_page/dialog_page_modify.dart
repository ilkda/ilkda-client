import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Dialog dialogPageModify(BuildContext context) {
  return Dialog(
    elevation: 0,
    backgroundColor: Colors.white,
    insetPadding: EdgeInsets.only(bottom: 130.h),
//    insetPadding: EdgeInsets.only(top: 178.h, bottom: 308.h),
    child: Stack(
      alignment: Alignment.center,
      children: [
        _background(),
        _closeButton(),
        _logo(),
        _pageModifyButton(),
        _saveButton()
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////elements

Widget _background() => Positioned(
  child: Container(
    width: 360.w,
    height: 314.h,
    color: Colors.white,
  ),
);

Widget _closeButton() => Positioned(
  top: 21.h,
  left: 31.w,
  child: GestureDetector(
    onTap: (){
      Get.back();
    },
    child: Image.asset(
      "assets/images/close_button.png",
      width: 15.w,
    ),
  ),
);

Widget _logo() => Positioned(
  top: 44.h,
  child: Image.asset(
    "assets/images/logo.png",
    height: 111.h,
  ),
);

Widget _pageModifyButton() => Positioned(
  top: 180.h,
  child: Container(
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
  ),
);

Widget _saveButton() => Positioned(
  top: 249.h,
  child: Container(
    width: 107.w,
    height: 40.h,
    child: ElevatedButton(
      onPressed: (){
        Get.find<HomePageViewController>().updateCurrentRecordPage().then(
          (value) {
            if(value) {
              Get.back();
            }
          }
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
          side: BorderSide(color: Colors.black, width: 1.w),
        ),
      ),
      child: Text("저장하기", style: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),),
    ),
  ),
);

////////////////////////////////////////////////////////////////////////////////page modify button elements
Widget _pageTextField() => Positioned(
  child: Container(
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        disabledBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder,
        focusedErrorBorder: _outlineInputBorder,
        hintText: Get.find<HomePageViewController>().currentBookRecord.value.readPage.toString(),
        hintStyle: TextStyle(
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