import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  @override
  void initState() {
    super.initState();

    Get.find<UserController>().ifKakaoTokenInLocalStorage().then((value) {
      //페이지 이동
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _title(),
            SizedBox(height: 15.h,),
            _subTitle(),
            SizedBox(height: 66.h),
            _kakaoButton(context),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  _title() => Container(
    width: 197.w,
    height: 77.h,
    alignment: Alignment.center,
    child: Text("읽다", style: TextStyle(
      fontSize: 40.sp,
    ),),
  );

  _subTitle() => Container(
    width: 263.w,
    height: 25.h,
    alignment: Alignment.center,
    child: Text(": 눈으로 보면서 그 내용이나 뜻을 알게 되다.", style: TextStyle(
      fontSize: 14.sp,
    ),),
  );

  _kakaoButton(BuildContext context) => ElevatedButton(
    onPressed: () async {
      if( await Get.find<UserController>().tryKakaoLogin()){
        print("login success!");
        //페이지 이동
      }
      else{
        print("login failed!");
      }
    },

    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      alignment: Alignment.center,
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      fixedSize: Size(
        239.w, 40.h
      ),
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: context.theme.primaryColorDark,
          width: 0.2.w,
        )
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/image/kakao.png", height: 25.h,),
        Container(
          width: 166.w,
          height: 25.h,
          alignment: Alignment.center,
          child: Text("카카오로 시작하기", style: TextStyle(
            fontSize: 14.sp,
            color: context.theme.primaryColorDark,
          ),),
        ),
      ],
    ),
  );
}
