import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/12_read_book_page/read_book_page.dart';
import 'package:ilkda_client/view/13_book_report_page/book_report_page.dart';
import 'package:ilkda_client/view/20_book_shelf_page/book_shelf_page.dart';
import 'package:ilkda_client/view_model/book_shelf_page_viewcontroller.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'constants/key.dart';
import 'view/0_login_page/login_page.dart';
import 'view/10_home_page/home_page.dart';
import 'view_model/home_page_viewcontroller.dart';
import 'view_model/user_controller.dart';
import 'view/11_search_page/search_page.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '${kakaoNativeAppKey}');
  runApp(IlkdaClient());
}

class IlkdaClient extends StatelessWidget {
  const IlkdaClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: '읽다',
          initialRoute: "/",
          initialBinding: BindingsBuilder(() {}),
          getPages: [
            GetPage(
              name: "/",
              page: () => const LogInPage(),
              binding: BindingsBuilder(() {
                Get.put(UserController());
              }),
            ),

            GetPage(
              name: "/Home",
              page: () => const HomePage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
              }),
              transition: Transition.leftToRight,
            ),
            GetPage(
              name: "/Home/Search",
              page: () => const SearchPage(),
            ),
            GetPage(
              name: "/Home/ReadBook",
              page: () => const ReadBookPage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
              }),
            ),
            GetPage(
              name: "/Home/BookReport",
              page: () => const BookReportPage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
              }),
            ),

            GetPage(
              name: "/BookShelf",
              page: () => const BookShelfPage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
                Get.put(BookShelfPageViewController());
              }),
              transition: Transition.rightToLeft,
            ),
          ],

          theme: ThemeData(
            fontFamily: "RIDIBatang",


            primaryColorDark: Colors.black,
            primaryColorLight: Colors.white,
            primaryColor: Color(0xFFFF918D),
            backgroundColor: Colors.white,
          ),
        );
      }
    );
  }
}
