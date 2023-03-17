import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/20_book_shelf_page/widget_book_calendar.dart';
import 'package:ilkda_client/view/20_book_shelf_page/widget_my_book_shelf.dart';
import 'package:ilkda_client/view/20_book_shelf_page/widget_navigation_bar.dart';

class BookShelfPage extends StatelessWidget {
  const BookShelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Column(
              children: [
                SizedBox(height: 33.h,),
                bookCalendar(),
                SizedBox(height: 14.h,),
                myBookShelf(),
              ]
            ),
          ),
          Positioned(
            bottom: 0,
            child: navigationBarBookShelfPage(),
          ),
        ],
      )
    ));
  }
}
