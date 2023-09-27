// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view_model/todo_view_model.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/model/todo_model.dart';

import 'package:todolist/widget/todo_button.dart';
import 'package:todolist/widget/todo_textfield.dart';

class ListModify extends StatefulWidget {
  int index;

  ListModify({required this.index, super.key});

  @override
  State<ListModify> createState() => _ListModifyState();
}

class _ListModifyState extends State<ListModify> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<TodoViewModel>(context, listen: false);
    int index = widget.index;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Modify"),
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
                viewModel.modifyTodoList(
                  viewModel.todoList[index].id,
                  textController.text,
                );

                viewModel.getTodoList();

                Navigator.pop(context);
              }, //width: 320.w,  height: 40.h,
              child: todoBotton('수정하기', 320, 40),
            ),
          ],
        ),
      ),
    );
  }
}
