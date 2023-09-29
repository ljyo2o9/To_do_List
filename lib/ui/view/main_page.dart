import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/model/todo_model.dart';

import 'package:todolist/ui/view/create.dart';
import 'package:todolist/ui/view/modify.dart';
import 'package:todolist/ui/view_model/todo_view_model.dart';

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
                          width: 210.h,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: GestureDetector(
                              onTap: () {
                                viewModel.delList(viewModel.todoList[index].id);
                                print(viewModel.todoList[index].id);
                                viewModel.getTodoList();
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 20.w,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ListModify(index: index),
                                ),
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
