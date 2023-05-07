import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/12_read_book_page/widget_navigation_bar.dart';

import 'widget_book.dart';
import 'widget_book_content.dart';
import 'widget_read_control.dart';

class ReadBookPage extends StatelessWidget {
  const ReadBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _background(context),
          _cardBackground(context),
          book(),
          bookContent(context),
          readControl(context),
          navigationBarReadBookPage(context),
        ],
      ),
    ));
  }
}

Widget _background(BuildContext context) => Positioned(
  width: 360.w,
  height: 800.h,
  child: GestureDetector(
    onTap: (){
      Get.offAndToNamed("/Home");
    },
    child: Container(
      color: context.theme.colorScheme.surface.withOpacity(0.9),
    ),
  ),
);

Widget _cardBackground(BuildContext context) => Positioned(
  bottom: 0,
  width: 360.w,
  height: 618.h,
  child: Container(
    decoration: BoxDecoration(
      color: context.theme.colorScheme.background,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.r),
        topRight: Radius.circular(32.r),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, -4), // changes position of shadow
        ),
      ],
    ),
  ),
);