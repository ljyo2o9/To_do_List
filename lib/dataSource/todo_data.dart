import 'package:todolist/model/todo_model.dart';

import 'package:hive_flutter/hive_flutter.dart';

class TodoDataSource {
  Box<TodoModel>? box;

  TodoDataSource() {
    init();
  }

  Future<void> init() async {
    box = await Hive.openBox<TodoModel>('todoList');
  }

  Future<List<TodoModel>> getTodoList() async {
    if (box == null) {
      await init();
    }

    // Hive box는 모든 값을 List로 반환하므로 추가적인 변환이 필요하지 않음
    final response = box!.values.toList();
    return response;
  }
}
