import 'package:todolist/data/dataSource/todo_data.dart';
import 'package:todolist/data/model/todo_model.dart';

class TodoRepository {
  final TodoDataSource _dataSource = TodoDataSource();

  Future<List<TodoModel>> getTodoList() {
    return _dataSource.getTodoList();
  }

  Future postTodoList(value) async {
    await _dataSource.postTodoList(value);
  }

  Future delTodoList() async {
    await _dataSource.delTodoList();
  }

  Future modifyTodoList(int id, String text) async {
    await _dataSource.modifyTodoList(id, text);
  }

  Future delList(id) async {
    await _dataSource.delList(id);
  }
}
