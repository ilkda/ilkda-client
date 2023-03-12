import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

import 'widget_app_bar.dart';
import 'widget_my_book_list.dart';
import 'widget_new_book_list.dart';
import 'widget_navigation_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Get.find<HomePageViewController>().searchAladinBooks();
    Get.find<HomePageViewController>().searchCurrentRecordList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 47.h,),
          appBarHomePage(),
          SizedBox(height: 26.h,),
          homePageMyBookList(),
          SizedBox(height: 136.h,),
          homePageNewBookList(),
          SizedBox(height: 65.68.h,),
          navigationBarHomePage(),
        ],
      ),
    ));
  }
}
