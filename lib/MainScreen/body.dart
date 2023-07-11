import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:to_do_list/list.dart';

Container body(BuildContext context) {
  var listController = Provider.of<ListController>(context);

  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/img/backgroundimg.png'),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          child: Row(
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
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listController.todolist.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 5.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert)),
                        SizedBox(width: 20.w),
                        Text(
                          listController.todolist[index],
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
