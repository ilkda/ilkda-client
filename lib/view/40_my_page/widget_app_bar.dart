import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget appBarSection(BuildContext context){
  return Container(
    width: 360.w,
    height: 266.h,
    decoration: BoxDecoration(
      color: context.theme.colorScheme.primary,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(32.r),
        bottomRight: Radius.circular(32.r),
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: 35.h,),
        _profilePicture(
          backgroundColor: context.theme.colorScheme.background,
          shadowColor: context.theme.colorScheme.background.withOpacity(0.25),
        ),
        SizedBox(height: 22.h,),
        _userName(textColor: context.theme.colorScheme.background),
        _userEmail(textColor: context.theme.colorScheme.onBackground),
        SizedBox(height: 24.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _readBook(textColor: context.theme.colorScheme.background,),
            SizedBox(width: 70.w,),
            _ranking(textColor: context.theme.colorScheme.background,),
          ],
        )
      ],
    ),
  );
}

Widget _profilePicture({required Color backgroundColor, required Color shadowColor}){
  return Container(
    width: 88.h,
    height: 88.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: backgroundColor,
        width: 3.w,
      ),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
        ),
        BoxShadow(
          color: backgroundColor,
          spreadRadius: -2.0,
          blurRadius: 4.0,
          offset: Offset(0, 2),
        ),
      ],
      image: DecorationImage(
        image: AssetImage("assets/images/profile_photo.png"),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget _userName({required Color textColor}){
  return Container(
    width: 125.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 14.w,),
        Text("아련나래", style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
          height: 1.0,
        ),),
        Image.asset("assets/images/edit.png", width: 14.w,),
      ],
    ),
  );
}

Widget _userEmail({required Color textColor}){
  return Text(
    "user123@gmail.com",
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      color: textColor,
    ),
  );
}

Widget _readBook({required Color textColor}){
  return Container(
    width: 91.w,
    height: 45.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("50권", style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),),
        Text("총 읽은 책", style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),),
      ],
    ),
  );
}

Widget _ranking({required Color textColor}){
  return Container(
    width: 91.w,
    height: 45.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("123등/456명", style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),),
        Text("읽은 책 3권", style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),),
      ],
    ),
  );
}