import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uberAir/constants/Constants.dart';
class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.0.w, bottom: 16.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.menu,
                color: primaryColor,
                size: 25,
              ),
              
              onPressed: () {
                print("amc licked");
               Scaffold.of(context).openDrawer();
              }),

        ],
      ),
    );
  }
}
