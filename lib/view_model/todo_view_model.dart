import 'package:flutter/widgets.dart';
import 'package:todolist/repository/todo_repository.dart';

import 'package:todolist/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _todoRepository = TodoRepository();

  List<TodoModel> _todoList = List.empty(growable: true);

  List<TodoModel> get todoList => _todoList;

  TodoViewModel() {
    getTodoList();
  }

  Future<void> getTodoList() async {
    _todoList = await _todoRepository.getTodoList();
    print(_todoList);
    notifyListeners();
  }
}
