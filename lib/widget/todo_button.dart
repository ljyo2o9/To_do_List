import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container todoBotton(String text, int wid, int hei) {
  return Container(
    width: wid.w,
    height: hei.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
