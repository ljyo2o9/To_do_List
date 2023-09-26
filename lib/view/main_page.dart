import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/todo_model.dart';

import 'package:todolist/view/create.dart';
import 'package:todolist/view_model/todo_view_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('TO DO LIST'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Consumer<TodoViewModel>(
          builder: (context, provider, child) {
            List<TodoModel> todoViewModel = provider.todoList;

            return ListView.builder(
              itemCount: todoViewModel.length,
              itemBuilder: (context, index) {
                print(todoViewModel[index].title);

                return Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
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
                );
              },
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
