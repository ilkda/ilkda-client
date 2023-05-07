import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget LogoSection(BuildContext context) {
  return Hero(
    tag: "logo section",
    child: Material(
      type: MaterialType.transparency,
      child: Container(
        width: 263.w,
        height: 218.h,
        child: Column(
          children: [
            //Logo
            Container(
              width: 114.h,
              height: 114.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            //
            Flexible(flex: 1, child: Container(),),
            //Name
            Text("읽다", style: TextStyle(
              fontSize: 40.sp,
              color: context.theme.colorScheme.background,
              fontWeight: FontWeight.w500,
            ),),
            //
            Flexible(flex: 7, child: Container(),),
            //SubTitle
            Text("눈으로 보면서 그 내용이나 뜻을 알게 되다", style: TextStyle(
              fontSize: 14.sp,
              color: context.theme.colorScheme.background,
              fontWeight: FontWeight.w400,
            ),),
          ],
        ),
      ),
    ),
  );
}