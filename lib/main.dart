import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/00_login_page/login_page.dart';
import 'package:ilkda_client/view_model/user_controller.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '4986af7734e2429d4f9cf6fe53bd864f');
  runApp(IlkdaClient());
}

class IlkdaClient extends StatelessWidget {
  const IlkdaClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: '읽다',
          initialRoute: "/LogIn",
          initialBinding: BindingsBuilder(() {}),
          getPages: [

            GetPage(
              name: "/LogIn",
              page: () => const LogInPage(),
              binding: BindingsBuilder(() {
                Get.put(UserController());
              }),
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
