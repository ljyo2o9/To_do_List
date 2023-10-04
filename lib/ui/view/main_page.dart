import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              child: Slidable(
                key: ValueKey(index),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async {
                        await viewModel.delList(viewModel.todoList[index].id);
                        await viewModel.getTodoList();
                      },
                      flex: 1,
                      borderRadius: BorderRadius.circular(15),
                      backgroundColor: Colors.red,
                      autoClose: false,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListModify(index: index),
                          ),
                        );
                      },
                      flex: 1,
                      borderRadius: BorderRadius.circular(15),
                      backgroundColor: Colors.blue,
                      autoClose: false,
                      icon: Icons.mode,
                      label: 'Modify',
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.h),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: SizedBox(
                        width: double.infinity,
                        height: 16.h,
                        child: Center(
                          child: Text(
                            todoViewModel[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
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

void doNothing(BuildContext context) {}
