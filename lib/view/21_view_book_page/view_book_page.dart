import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/record.dart';
import 'package:ilkda_client/view/21_view_book_page/widget_navigation_bar.dart';
import 'package:palette_generator/palette_generator.dart';

import 'widget_app_bar.dart';
import 'widget_book.dart';

class ViewBookPage extends StatefulWidget {
  final Record record;

  const ViewBookPage({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  State<ViewBookPage> createState() => _ViewBookPageState();
}

class _ViewBookPageState extends State<ViewBookPage> {
  Color backgroundColor = Colors.white;
  @override
  void initState() {
    super.initState();

    getImagePalette(NetworkImage(widget.record.book.cover)).then((value) {
      setState(() {
        backgroundColor = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 69.h,),
          appBarViewBookPage(context),
          SizedBox(height: 33.41.h,),
          bookSection(context, widget.record),
          SizedBox(height: 64.h,),
          navigationBarViewBookPage(),
        ],
      ),
    );
  }

  Future<Color> getImagePalette (ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator
      .fromImageProvider(imageProvider);
    return paletteGenerator.lightMutedColor!.color;
  }
}
