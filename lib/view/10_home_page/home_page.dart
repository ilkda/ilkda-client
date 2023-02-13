import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Column(
        children: [
          SizedBox(height: 29.h,),
          _logo(),
          SizedBox(height: 7.h,),
          _readStart(context),
          SizedBox(height: 26.h,),
          _recommand_Books(context),
        ],
      ),
    ));
  }

  //////////////////////////////////////////////////////////////////////////////logo
  _logo() => Image.asset(
    "assets/image/logo.png",
    width: 83.w,
    height: 83.h,
  );

  //////////////////////////////////////////////////////////////////////////////readStart
  _readStart(BuildContext context) => Container(
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 191.w,
              height: 34.h,
              alignment: Alignment.center,
              child: Text("지금 책을 읽어보세요.", style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400
              ),),
            ),
            Container(
              height: 0.7.h,
              width: 169.w,
              color: context.theme.primaryColorDark.withOpacity(0.8),
            ),
          ],
        ),
        Container(
          width: 360.w,
          height: 205.h,
          child: Icon(Icons.add, size: 30.h, color: Color(0xFFB8B8B8),),
          color: context.theme.primaryColorDark.withOpacity(0.05),
        ),
      ],
    )
  );

  //////////////////////////////////////////////////////////////////////////////recommand_books
  _recommand_Books(BuildContext context) => Container(
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 191.w,
              height: 34.h,
              alignment: Alignment.center,
              child: Text("내 관심 분야 추천 도서", style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400
              ),),
            ),
            Container(
              height: 0.7.h,
              width: 169.w,
              color: context.theme.primaryColorDark.withOpacity(0.8),
            ),
          ],
        ),
        Container(
          width: 360.w,
          height: 221.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List<Widget>.from(Get.find<HomePageViewController>().aladinBooks.map((element) => _Book(
              imageLink: element.cover,
              title: element.title
            ))),
          ),
        ),
      ],
    ),
  );

  _Book({required String imageLink, required String title}) => Container(
    width: 95.w,
    height: 160.h,
    child: Column(
      children: [
        Image.network(imageLink, width: 94.w,),
        Text(title, style: TextStyle(
          fontSize: 8.sp
        ),)
      ],
    ),
  );

}
