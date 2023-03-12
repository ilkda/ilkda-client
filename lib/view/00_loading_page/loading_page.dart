import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().tryAutoSignIn().then((value) {
      //페이지 이동
      if(value) Get.toNamed("/Home");
      else Get.toNamed("/Login");
    });
    return const Placeholder();
  }
}
