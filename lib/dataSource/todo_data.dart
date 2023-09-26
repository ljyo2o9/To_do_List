import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/model/todo_model.dart';

class TodoDataSource {
  SharedPreferences? _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<List<TodoModel>> getTodoList() async {
    if (_pref == null) {
      await init();
    }

    final response = _pref!.getStringList('mainList') ?? [];
    return response.map((item) => TodoModel(title: item)).toList();
  }
}
