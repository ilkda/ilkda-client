import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import 'widget_user_name_set.dart';

class UserNameSetPage extends StatelessWidget {
  const UserNameSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360.w,
        height: 800.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.h, ),
              _profilePhoto(),
              SizedBox(height: 115.h, ),
              userNameSet(),
              SizedBox(height: 161.h, ),
              _submit(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _profilePhoto(){
  return Column(
    children: [
      Container(
        width: 210.h,
        height: 210.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Get.context!.theme.colorScheme.onPrimary,
        ),
        child: Image.asset("assets/images/profile_photo.png"),
      ),
      SizedBox(height: 20.h,),
      Text("프로필 사진", style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 14.sp,
      ),),
    ],
  );
}

Widget _submit(){
  return Container(
    width: 238.w,
    height: 40.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: true ? Get.context!.theme.colorScheme.background : Get.context!.theme.colorScheme.primary,
        side: true ? BorderSide(
          color: Get.context!.theme.colorScheme.outline,
          width: 1.w,
        ) : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text("읽다 시작하기", style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: true ? Get.context!.theme.colorScheme.outline : Get.context!.theme.colorScheme.background,
      ),),
    ),
  );
}