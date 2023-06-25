import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/00_loading_page/loading_page.dart';
import 'package:ilkda_client/view/01_login_page/login_page.dart';
import 'package:ilkda_client/view/12_read_book_page/read_book_page.dart';
import 'package:ilkda_client/view/13_book_report_page/book_report_page.dart';
import 'package:ilkda_client/view/20_book_shelf_page/book_shelf_page.dart';
import 'package:ilkda_client/view/21_view_book_page/view_book_page.dart';
import 'package:ilkda_client/view/22_view_book_review_page/view_book_review_page.dart';
import 'package:ilkda_client/view/30_club_home_page/club_home_page.dart';
import 'package:ilkda_client/view/31_club_registration_page/club_registration_page.dart';
import 'package:ilkda_client/view/40_my_page/my_page.dart';
import 'package:ilkda_client/view_model/book_shelf_page_viewcontroller.dart';
import 'package:ilkda_client/view_model/club_page_viewcontroller.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'constants/key.dart';
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
          initialBinding: BindingsBuilder(() {
            //test
            Get.put(UserController());
          }),
          getPages: [
            GetPage(
              name: "/",
              page: () => LoadingPage(),
              binding: BindingsBuilder(() {
                Get.put(UserController());
              }),
              transition: Transition.noTransition
            ),
            GetPage(
              name: "/LogIn",
              page: () => LogInPage(),
              binding: BindingsBuilder(() {
                Get.put(UserController());
              }),
              transition: Transition.noTransition
            ),

            GetPage(
              name: "/Home",
              page: () => const HomePage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
              }),
              transition: Transition.noTransition
            ),
            GetPage(
              name: "/Home/Search",
              page: () => const SearchPage(),
              transition: Transition.noTransition
            ),
            GetPage(
              name: "/Home/ReadBook",
              page: () => const ReadBookPage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
              }),
              transition: Transition.noTransition
            ),
            GetPage(
              name: "/Home/BookReport",
              page: () => const BookReportPage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
              }),
              transition: Transition.noTransition
            ),

            GetPage(
              name: "/BookShelf",
              page: () => const BookShelfPage(),
              binding: BindingsBuilder(() {
                Get.put(HomePageViewController());
                Get.put(BookShelfPageViewController());
              }),
              transition: Transition.noTransition
            ),
            GetPage(
              name: "/BookShelf/ViewBook",
              page: () => ViewBookPage(
                record: Get.arguments["record"],
              ),
              arguments: const { "record",},
              transition: Transition.noTransition
            ),
            GetPage(
              name: "/BookShelf/ViewBookReview",
              page: () => ViewBookReviewPage(
                review: Get.arguments["review"],
              ),
              arguments: const { "review",},
              transition: Transition.noTransition
            ),

            GetPage(
              name: "/Club",
              page: () => ClubHomePage(),
              transition: Transition.noTransition,
              binding: BindingsBuilder(() {
                Get.put(ClubPageViewController());
              }),
            ),
            GetPage(
              name: "/Club/Registeration",
              page: () => ClubRegistrationPage(),
              transition: Transition.noTransition
            ),

            GetPage(
              name: "/MyPage",
              page: () => MyPage(),
              transition: Transition.noTransition
            ),
          ],

          theme: ThemeData(
            fontFamily: "NotoSansKR",

            colorScheme: const ColorScheme.light(
              primary: Color(0xFFFF7A8A),
              outline: Color(0xFF000000),
              onSurface: Color(0xFF585858),
              // onTertiary: Color(0xFF797979),
              surface: Color(0xFF9E9E9E),
              tertiary: Color(0xFFABABAB),
              onBackground: Color(0xFFCFCFCF),
              onPrimary: Color(0xFFF2F2F2),
              background: Color(0xFFFFFFFF),
            ),
          ),
        );
      }
    );
  }
}
