import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget_manuscript.dart';

class ViewBookReviewPage extends StatelessWidget {
  final String review;

  const ViewBookReviewPage({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(height: 70.h,),
            _appBar(context),
            SizedBox(height: 16.h,),
            manuScript(review),
          ],
        ),
      )
    );
  }
}

Widget _appBar(BuildContext context) => Container(
  width: 298.w,
  height: 23.h,
  child: Row(
    children: [
      GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Image.asset(
          "assets/icons/back.png",
          height: 20.91.h,
        )
      ),
      SizedBox(width: 10.4.w,),
      Text("감상 기록", style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: context.theme.colorScheme.outline,
        height: 1.0,
      ),),
    ],
  ),
);
