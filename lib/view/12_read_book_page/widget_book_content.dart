import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/12_read_book_page/dialog_page_modify.dart';
import 'package:ilkda_client/view_model/home_page_viewcontroller.dart';

Widget bookContent(BuildContext context){
  return Positioned(
    top: 434.h,
    child: Column(
      children: [
        _bookInfo(context),
        SizedBox(height: 20.h,),
        _pageIndicator(
          context,
          (100 * Get.find<HomePageViewController>().currentBookRecord.value.readPage / Get.find<HomePageViewController>().currentBookRecord.value.book.page).toInt(),
        ),
      ],
    )
  );
}

////////////////////////////////////////////////////////////////////////////////Book Information
Widget _bookInfo(BuildContext context) => Container(
  width: 220.w,
  height: 99.h,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _title(context),
      _author(context),
      _pages(context),
      _publisher(context),
      _publishedDate(context),
    ],
  ),
);

Widget _title(BuildContext context) => Text(
  Get.find<HomePageViewController>().currentBookRecord.value.book.title,
  style: TextStyle(
    fontSize: 15.sp,
    color: context.theme.colorScheme.outline,
    fontWeight: FontWeight.w500,
    height: 1.0,
    overflow: TextOverflow.ellipsis,
  ),
);

Widget _author(BuildContext context) => Row(
  children: [
    Text(
      "저자",
      style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w300,
        height: 1.0,
      ),
    ),
    SizedBox(width: 17.w),
    Flexible(
      child: Text(
        Get.find<HomePageViewController>().currentBookRecord.value.book.author,
        style: TextStyle(
          fontSize: 12.sp,
          color: context.theme.colorScheme.outline,
          fontWeight: FontWeight.w300,
          height: 1.0,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
  ],
);

Widget _pages(BuildContext context) => Row(
  children: [
    Text(
      "쪽수",
      style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w300,
        height: 1.0,
      ),
    ),
    SizedBox(width: 17.w),
    Text(
      "${Get.find<HomePageViewController>().currentBookRecord.value.book.page}쪽",
      style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w300,
        height: 1.0,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
);

Widget _publisher(BuildContext context) => Row(
  children: [
    Text(
      "출판",
      style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w300,
        height: 1.0,
      ),
    ),
    SizedBox(width: 17.w),
    Text(
      Get.find<HomePageViewController>().currentBookRecord.value.book.publisher,
      style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w300,
        height: 1.0,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
);

Widget _publishedDate(BuildContext context) => Row(
  children: [
    Text(
      "발행",
      style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w300,
        height: 1.0,
      ),
    ),
    SizedBox(width: 17.w),
    Text(
      Get.find<HomePageViewController>().currentBookRecord.value.book.publishedDate,
      style: TextStyle(
        fontSize: 12.sp,
        color: context.theme.colorScheme.outline,
        fontWeight: FontWeight.w300,
        height: 1.0,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
);

////////////////////////////////////////////////////////////////////////////////Page Indicator
Widget _pageIndicator(BuildContext context, int percentage) => Container(
  width: 276.w,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _pageProgressIndicator(context, percentage),
      _pageNote(context, percentage),
    ],
  ),
);

Widget _pageProgressIndicator(BuildContext context, int percentage) => Container(
  width: 279.w,
  height: 14.h,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 245.w,
        height: 11.5.h,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 100 - percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.onPrimary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 4.w),
      Container(
        alignment: Alignment.centerRight,
        child: Text(percentage.toString() + "%", style: TextStyle(
          fontSize: 12.sp,
          color: context.theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
          height: 1.0,
        ),),
      ),
    ],
  ),
);

Widget _pageNote(BuildContext context, int percentage) => Row(
  children: [
    Container(
      width: 251.w * percentage / 100,
    ),
    Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/page_note.png", width: 56.79.w, height: 32.2.h,),
        Positioned(
          bottom: 4.h,
          child: Text(
            "${Get.find<HomePageViewController>().currentBookRecord.value.readPage.toString()}쪽",
            style: TextStyle(
              fontSize: 14.sp,
              color: context.theme.colorScheme.background,
              fontWeight: FontWeight.w700,
              height: 1.0,
            ),
          ),
        )
      ],
    )
  ],
);