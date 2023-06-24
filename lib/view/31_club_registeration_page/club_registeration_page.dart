import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilkda_client/view/31_club_registeration_page/widget_club_member_section.dart';
import 'package:ilkda_client/view/31_club_registeration_page/widget_club_name_section.dart';
import 'package:ilkda_client/view_model/club_page_viewcontroller.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

import 'widget_navigation_bar.dart';

class ClubRegisterationPage extends StatelessWidget {
  const ClubRegisterationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 64.h,),
                  _title(context),
                  SizedBox(height: 47.h,),
                  clubNameSection(context),
                  SizedBox(height: 33.h,),
                  _clubLeader(context),
                  SizedBox(height: 35.h,),
                  clubMemberSection(context),
                  SizedBox(height: 45.h,),
                  _buttonSubmit(context),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: navigationBarClubRegisteration(),
          ),
        ],
      ),
    ));
  }
}

Widget _title(BuildContext context){
  return Container(
    child: Text(
      "모임 만들기", style: TextStyle(
      color: context.theme.colorScheme.outline,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    )),
  );
}

Widget _clubLeader(BuildContext context){
  return Container(
    width: 307.w,
    height: 57.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("모임을 이끄는 사람", style: TextStyle(
          color: context.theme.colorScheme.outline,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
          height: 1,
        ),),
        Container(
          width: 307.w,
          height: 28.h,
          padding: EdgeInsets.only(left: 10.w, right: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              color: context.theme.colorScheme.onTertiary,
              width: 0.4.w,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Get.find<UserController>().ilkdaUser.name,
                style: TextStyle(
                  color: context.theme.colorScheme.outline,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              Image.asset("assets/icons/close.png", height: 8.h),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buttonSubmit(BuildContext context){
  return Container(
    width: 307.w,
    alignment: Alignment.center,
    child: ElevatedButton(
      onPressed: (){
        Get.find<ClubPageViewController>().registerClub();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.r),
        ),
        side: BorderSide(
          color: context.theme.colorScheme.outline,
          width: 1.w,
        ),
        backgroundColor: context.theme.colorScheme.background,
        elevation: 5,
        fixedSize: Size(91.w, 34.02.h),
      ),
      child: Text("만들기", style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: context.theme.colorScheme.outline,
      ),),
    ),
  );
}