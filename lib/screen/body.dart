import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:to_do_list/list.dart';

Container body() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/img/backgroundimg.png'),
      ),
    ),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.w),
            Padding(
              padding: EdgeInsets.only(top: 13.h),
              child: Text(
                "Today List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 170.w),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Text(
                "1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(todolist[0]['title']),
            ),
          ),
        )
      ],
    ),
  );
}
