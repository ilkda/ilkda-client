import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/00_login_page/test_page.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

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
      // 카카오 로그인 구현 예제

      // 카카오톡 실행 가능 여부 확인
      // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인

      OAuthToken token;
      if (await isKakaoTalkInstalled()) {
        try {
          token = await UserApi.instance.loginWithKakaoTalk();
          print(token.accessToken);
          Get.to(() => TestPage(text: token.accessToken,));
          print('카카오톡으로 로그인 성공');
        } catch (error) {
          print('카카오톡으로 로그인 실패 $error');

          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') {
            return;
          }
          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            token = await UserApi.instance.loginWithKakaoAccount();
            Get.to(() => TestPage(text: token.accessToken,));
            print('카카오계정으로 로그인 성공');
          } catch (error) {
            print('카카오계정으로 로그인 실패 $error');
          }
        }
      } else {
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          Get.to(() => TestPage(text: token.accessToken,));
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
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
