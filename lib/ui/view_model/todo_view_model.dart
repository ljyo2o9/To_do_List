import 'package:flutter/widgets.dart';
import 'package:todolist/data/repository/todo_repository.dart';
import 'package:todolist/data/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _todoRepository = TodoRepository();

  List<TodoModel> _todoList = List.empty(growable: true);

  List<TodoModel> get todoList => _todoList;

  TodoViewModel() {
    getTodoList();
  }

  Future<void> getTodoList() async {
    List<TodoModel> items = await _todoRepository.getTodoList();

    _todoList = items;
    notifyListeners();
  }

  Future<void> postTodoList(value) async {
    await _todoRepository.postTodoList(value);
    notifyListeners();
  }

  Future<void> delTodoList() async {
    await _todoRepository.delTodoList();
    notifyListeners();
  }

  Future<void> modifyTodoList(int id, String text) async {
    await _todoRepository.modifyTodoList(id, text);
    notifyListeners();
  }

  Future<void> delList(int id) async {
    await _todoRepository.delList(id);
    notifyListeners();
  }
}
