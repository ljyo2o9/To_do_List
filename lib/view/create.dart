// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view_model/todo_view_model.dart';

import 'package:todolist/widget/todo_button.dart';
import 'package:todolist/widget/todo_textfield.dart';

class ListCreate extends StatefulWidget {
  const ListCreate({super.key});

  @override
  State<ListCreate> createState() => _ListCreateState();
}

class _ListCreateState extends State<ListCreate> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<TodoViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Create"),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                child: todoTextField(320, 420, textController),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                await viewModel.postTodoList(textController.text);
                await viewModel.getTodoList();

                Navigator.pop(context);
              }, //width: 320.w,  height: 40.h,
              child: todoBotton('생성하기', 320, 40),
            ),
          ],
        ),
      ),
    );
  }
}
