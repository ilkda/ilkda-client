import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget_navigation_bar.dart';

class ClubHomePage extends StatelessWidget {
  const ClubHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox( height: 218.h,),
            _logoSection(context),
            SizedBox( height: 33.44.h,),
            _buttonSection(context),
            SizedBox( height: 231.h,),
            navigationBarClubHome(),
          ],
        ),
      ),
    );
  }
}

Widget _logoSection(BuildContext context){
  return Container(
    width: 233.38.w,
    height: 213.56.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("사람들과 함께 책을 읽어보세요!", style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: context.theme.colorScheme.outline,
        ),),
        Image.asset("assets/images/club.png", height: 134.56.h,),
      ],
    ),
  );
}

Widget _buttonSection(BuildContext context){
  return Container(
    width: 235.w,
    height: 40.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buttonElement(context, "모임 찾기", (){}),
        _buttonElement(context, "모임 만들기", (){
          Get.toNamed("/Club/Registeration");
        }),
      ],
    ),
  );
}

Widget _buttonElement(BuildContext context, String text, void Function() onPressed){
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.r),
      ),
      side: BorderSide(
        color: context.theme.colorScheme.outline,
        width: 1.w,
      ),
      backgroundColor: context.theme.colorScheme.background,
      elevation: 5,
      fixedSize: Size(107.w, 40.h),
    ),
    child: Text(text, style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: context.theme.colorScheme.outline,
    ),),
  );
}
