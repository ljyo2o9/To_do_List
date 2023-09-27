import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container todoTextField(int wid, int hei, controller) {
  return Container(
    width: wid.w,
    height: hei.h,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 8.h),
      child: TextField(
        controller: controller,
        maxLines: 1000,
        decoration: const InputDecoration(
          hintText: '쓸 내용을 입력해주세요',
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
