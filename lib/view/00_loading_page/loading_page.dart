import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/user_controller.dart';
import 'widget_logo_section.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Get.find<UserController>().tryAutoSignIn().then((value) {
      //페이지 이동
      if(value) Get.toNamed("/Home");
      else Get.toNamed("/LogIn");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primary,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 58.h),
        width: 360.w,
        height: 800.h,
        child: LogoSection(context),
      )
    );
  }
}
