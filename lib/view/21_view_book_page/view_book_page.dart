import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget_app_bar.dart';
import 'widget_book.dart';
import 'widget_read_control.dart';

class ViewBookPage extends StatelessWidget {
  const ViewBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 47.h,),
          appBarViewBookPage(),
          SizedBox(height: 17.h,),
          bookSection(),
          SizedBox(height: 34.h,),
          readControlSection(context),
        ],
      ),
    ));
  }
}
