import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilkda_client/model/ilkda_user.dart';
import 'package:ilkda_client/view_model/club_page_viewcontroller.dart';

Widget clubMemberSection(BuildContext context){
  return Container(
    width: 307.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context.theme.colorScheme.outline),
        SizedBox(height: 7.h,),
        _inputSection(context)
      ]
      + List<Widget>.from(Get.find<ClubPageViewController>().club.value.clubMembers.map((e) => _memberElement(context, e)).toList()),
    ),
  );
}

Widget _title(Color textColor){
  return Text("함께 읽을 사람", style: TextStyle(
    color: textColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 1,
  ),);
}

Widget _inputSection(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _textField(context),
      _addButton(context),
    ],
  );
}

Widget _textField(BuildContext context){
  return SizedBox(
    width: 241.w,
    height: 28.h,
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      controller: Get.find<ClubPageViewController>().clubMemberController,
      style: TextStyle(
        color: context.theme.colorScheme.outline,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1,
      ),
      decoration: InputDecoration(
        hintText: "함께 읽을 사람을 추가하세요.",
        hintStyle: TextStyle(
          color: context.theme.colorScheme.tertiary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 1,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: context.theme.colorScheme.onSurface,
            width: 0.4.w,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 0.4.w,
          ),
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        isDense: true,

        suffixIcon: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Image.asset("assets/icons/close.png"),
          ),
          onTap: (){
            Get.find<ClubPageViewController>().clearClubMemberController();
          },
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 8.h,
        ),
      ),
    ),
  );
}

Widget _addButton(BuildContext context){
  return GestureDetector(
    onTap: (){
      Get.find<ClubPageViewController>().addClubMemberFromTextController();
      Get.find<ClubPageViewController>().clearClubMemberController();
    },
    child: Container(
      width: 60.w,
      height: 28.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: context.theme.colorScheme.onTertiary,
          width: 0.4.w,
        ),
      ),
      child: Text(
        "추가하기",
        style: TextStyle(
          color: context.theme.colorScheme.onSurface,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          height: 1,
        ),
      ),
    ),
  );
}

Widget _memberElement(BuildContext context, IlkdaUser ilkdaUser){
  return Container(
    width: 307.w,
    height: 28.h,
    padding: EdgeInsets.only(left: 10.w, right: 12.w),
    margin: EdgeInsets.only(top: 10.h),
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
          "${ilkdaUser.name} (${ilkdaUser.email})",
          style: TextStyle(
            color: context.theme.colorScheme.outline,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
        GestureDetector(
          onTap: (){
            Get.find<ClubPageViewController>().removeClubMember(ilkdaUser);
          },
          child: Image.asset("assets/icons/close.png", height: 8.h)
        ),
      ],
    ),
  );
}