import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:to_do_list/list.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final todaylist = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var listcontroller = Provider.of<ListController>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: AppBar(
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
            child: IconButton(
              icon: const Icon(Icons.check),
              color: const Color(0xFF6BB16D),
              onPressed: () {
                listcontroller.add(todaylist.text);
                Navigator.pop(context);
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
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
                child: TextField(
                  controller: todaylist,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: '오늘은 어떤 일을 하셨나요?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
