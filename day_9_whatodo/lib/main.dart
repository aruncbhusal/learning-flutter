import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatodo/screens/tasks_screen.dart';
import 'package:whatodo/models/all_tasks.dart';

void main() {
  runApp(const Whatodo());
}

// Since we're going to do it from scratch (following the course but not copying, of course)
// Let's create a new stateless widget for our app
class Whatodo extends StatelessWidget {
  const Whatodo({super.key});

  @override
  Widget build(BuildContext context) {
    // Since the modal sheet had to be popped with Navigator, it must be a separate subtree inside MaterialApp
    // So we must wrap the MaterialApp in a Provider and get the tasks list here to be able to access them everywhere

    // To be able to update the list, I created a class that extends ChangeNotifier with the list of Task objects
    // It has getters for tasks and number of tasks, and a method to add a task
    return ChangeNotifierProvider<AllTasks>(
      create: (context) => AllTasks(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
