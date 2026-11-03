// import 'package:flutter/material.dart';
// Rather than importing the entire material package, we can simply import its subset:
import 'package:flutter/foundation.dart';
import 'package:whatodo/models/task.dart';
import 'dart:collection';

// She called this class TaskData
class AllTasks extends ChangeNotifier {
  final List<Task> _tasks = [];

  // We don't actually need to pass any task with the constructor to populate the list
  // It was done just to see it in action
  // AllTasks(List<Task>? tasks) {
  //   if (tasks != null) _tasks = tasks;
  // }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // Yup, she implemented this as well, and called it updateTask, but I wanted to keep things simple
  // She passes the task object instead of the index though
  void toggleDone(int index){
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void removeAt(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }

  // We can't simply return the tasks as a list here because then we'd be able to modify it
  // To prevent that we can use the UnmodifiableListView class from collection library
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  // Each task itself is mutable, only the list itself is immutable.

  // Surprisingly she also made a getter for length since we use it multiple times
  int get length => _tasks.length;

  // In fact let me make some methods just for the hell of it
  String taskTitle(int idx) => _tasks[idx].title;
  bool isTaskDone(int idx) => _tasks[idx].isDone;
}
