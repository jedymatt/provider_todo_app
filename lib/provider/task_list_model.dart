import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo.dart';

class TaskListModel extends ChangeNotifier {
  final List<Todo> _todos = [Todo(title: 'buy iphone')];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void addItem(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateItemIsCompleteValue(int index, bool isComplete) {
    _todos[index].isComplete = isComplete;
    notifyListeners();
  }

  void removeItem(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
