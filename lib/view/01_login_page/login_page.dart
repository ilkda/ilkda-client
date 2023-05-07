import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/00_loading_page/widget_logo_section.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoSection(context),
            SizedBox(height: 258.h,),
            _kakaoButton(context),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////elements

  _kakaoButton(BuildContext context) => ElevatedButton(
    onPressed: () async {
      if( await Get.find<UserController>().tryKakaoLogin()){
        print("login success!");
        //페이지 이동
        Get.toNamed("/Home");
      }
      else{
        print("login failed!");
      }
    },

    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      alignment: Alignment.center,
      backgroundColor: context.theme.colorScheme.background,
      elevation: 5,
      fixedSize: Size(
        239.w, 40.h
      ),
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: context.theme.colorScheme.onSurface,
          width: 0.2.w,
        )
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/kakao.png", height: 25.h,),
        Container(
          width: 166.w,
          height: 25.h,
          alignment: Alignment.center,
          child: Text("카카오로 시작하기", style: TextStyle(
            fontSize: 14.sp,
            color: context.theme.colorScheme.onSurface,
          ),),
        ),
      ],
    ),
  );
}
