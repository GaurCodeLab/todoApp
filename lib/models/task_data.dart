import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoApp/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'buy fish'),
    Task(name: 'buy shirt'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task removeTaskTile) {
    _tasks.remove(removeTaskTile);
    notifyListeners();
  }

  void undoRemoveTask(int index, Task task) {
    _tasks.insert(index, task);
    notifyListeners();
  }
}
