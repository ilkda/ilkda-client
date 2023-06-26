import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget_app_bar.dart';
import 'widget_navigation_bar.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Column(
              children: [
                appBarSection(context),
                SizedBox(height: 17.h,),
                _stampSection(),
                SizedBox(height: 53.h,),
                _buttonSection(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: navigationBarMyPage(),
          ),
        ],
      ),
    );
  }
}

Widget _stampSection(){
  return Container(
    width: 322.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("획득한 도장", style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Get.context!.theme.colorScheme.outline,
        )),
        SizedBox(height: 24.h,),
        Container(
          padding: EdgeInsets.only(left: 5.w, bottom: 22.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/stamp/read_1.png', width: 58.w, height: 58.w),
              Image.asset('assets/images/empty_element.png', width: 58.w, height: 58.w),
              Image.asset('assets/images/empty_element.png', width: 58.w, height: 58.w),
              Image.asset('assets/images/empty_element.png', width: 58.w, height: 58.w),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5.w, bottom: 22.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/empty_element.png', width: 58.w, height: 58.w),
              Image.asset('assets/images/empty_element.png', width: 58.w, height: 58.w),
              SizedBox(width: 58.w,),
              SizedBox(width: 58.w,),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buttonSection(){
  return Container(
    width: 312.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buttonChangeProfilePhoto(),
        SizedBox(height: 26.h,),
        _buttonChangeInterests(),
      ],
    ),
  );
}

Widget _buttonChangeProfilePhoto(){
  return Row(
    children: [
      Image.asset('assets/images/empty_element.png', width: 35.w, height: 35.w),
      SizedBox(width: 12.w,),
      Text("프로필 사진 변경하기", style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Get.context!.theme.colorScheme.outline,
      )),
    ],
  );
}

Widget _buttonChangeInterests(){
  return Row(
    children: [
      Image.asset('assets/images/empty_element.png', width: 35.w, height: 35.w),
      SizedBox(width: 12.w,),
      Text("프로필 사진 변경하기", style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Get.context!.theme.colorScheme.outline,
      )),
    ],
  );
}