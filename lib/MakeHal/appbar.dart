import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar appBar(context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
      color: Colors.black,
    ),
    backgroundColor: const Color(0xFFEAEAEA),
    centerTitle: true,
    title: const Text(
      '한 일 추가하기',
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 18.w),
        child: const Icon(Icons.check, color: Color(0xFF6BB16D)),
      ),
    ],
  );
}
