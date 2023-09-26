class TodoModel {
  final String title;

  TodoModel({required this.title});

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(title: map['title']);
  }
}
