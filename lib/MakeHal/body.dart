import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Column body() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(16.w, 15.h, 16.w, 5.w),
        child: Container(
          width: double.infinity,
          height: 40.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: const TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: '오늘은 어떤 일을 하셨나요?',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
