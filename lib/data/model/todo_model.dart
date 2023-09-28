import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(1, defaultValue: '')
  late String title;

  @HiveField(2)
  final int id;

  TodoModel({required this.title, required this.id});

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(title: map['title'], id: map['id']);
  }
}
