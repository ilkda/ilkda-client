import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/view/11_search_page/search_result_list.dart';

import 'widget_app_bar.dart';
import '../1_home_page/widget_navigation_bar.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 47.h,),
          appBarHomePage(),
          searchResultList(),
          navigationBarHomePage(),
        ],
      ),
    ));
  }
}
