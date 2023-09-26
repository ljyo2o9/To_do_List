import 'package:flutter/widgets.dart';
import 'package:todolist/repository/todo_repository.dart';

import 'package:todolist/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _todoRepository = TodoRepository();

  final List<TodoModel> _todoList = List.empty(growable: true);

  List<TodoModel> get todoList => _todoList;

  TodoViewModel() {
    getTodoList();
  }

  Future<void> getTodoList() async {
    List<TodoModel> items = await _todoRepository.getTodoList();

    _todoList.addAll(items);
    notifyListeners();
  }
}
