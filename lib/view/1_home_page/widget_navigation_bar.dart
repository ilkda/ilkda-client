import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget navigationBarHomePage() => Container(
  height: 65.h,
  width: 360.w,
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        spreadRadius: 0,
        blurRadius: 4,
        offset: Offset(0, -4), // changes position of shadow
      ),
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset("assets/images/read.png", height: 45.h,),
      Image.asset("assets/images/book_shelf.png", height: 45.h,),
      Image.asset("assets/images/group.png", height: 45.h,),
      Image.asset("assets/images/account.png", height: 45.h,),
    ],
  ),
);