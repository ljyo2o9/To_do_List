import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

AppBar appbar() {
  return AppBar(
    backgroundColor: const Color(0xFF3e63fc),
    elevation: 0,
    title: const Text('TO DO LIST'),
    centerTitle: true,
    leading: GestureDetector(
      child: const Icon(
        Icons.incomplete_circle,
      ),
      onTap: () {},
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: const Icon(Icons.settings),
      )
    ],
  );
}
