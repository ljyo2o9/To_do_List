import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/todo_model.dart';

import 'package:todolist/view/create.dart';
import 'package:todolist/view_model/todo_view_model.dart';

import 'package:todolist/widget/todo_button.dart';
import 'package:todolist/widget/todo_textfield.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<TodoViewModel>(context);
    List<TodoModel> todoViewModel = viewModel.todoList;

    TextEditingController modifyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('TO DO LIST'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: GestureDetector(
              onTap: () async {
                await viewModel.delTodoList();
                await viewModel.getTodoList();
              },
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          itemCount: todoViewModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Text
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: SizedBox(
                          width: 230.h,
                          child: Text(
                            todoViewModel[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /// Modify Button
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 200.h,
                                child: Column(
                                  children: [
                                    /// Todo TextField
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: todoTextField(
                                          300, 80, modifyController),
                                    ),

                                    /// 수정하기 버튼
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          viewModel.modifyTodoList(
                                            viewModel.todoList[index].id,
                                            modifyController.text,
                                          );

                                          viewModel.getTodoList();

                                          Navigator.pop(context);
                                        },
                                        child: todoBotton('수정하기', 300, 30),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.mode,
                          color: Colors.white,
                          size: 20.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ListCreate();
              },
            ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
