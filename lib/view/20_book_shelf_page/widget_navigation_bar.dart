import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget navigationBarBookShelfPage() => Hero(
  tag: "navigationBar",
  child: Container(
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
        _navigationBarElement("assets/images/read.png", "/Home"),
        _navigationBarElement("assets/images/book_shelf.png", ""),
        _navigationBarElement("assets/images/group.png", ""),
        _navigationBarElement("assets/images/account.png", ""),
      ],
    ),
  ),
);

Widget _navigationBarElement(String assetImage, String routeName){
  return GestureDetector(
    onTap: (){
      if(routeName.isNotEmpty) Get.toNamed(routeName);
    },
    child: Image.asset(assetImage, height: 45.h,),
  );
}