import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatodo/widgets/task_tile.dart';
import 'package:whatodo/models/all_tasks.dart';

// This stateless widget subscribes to AllTasks and renders the task list.
class TaskList extends StatelessWidget{
   const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    // Since we refer to tasks multiple times below, I thought it's better to store it in a variable
    // final List<Task> tasks = Provider.of<AllTasks>(context).tasks;

    // Instead, I'll use what was shown in the course and make use of the Consumer widget
    // though it's not really needed here since I solved it without it as well
    return Consumer<AllTasks>(
      builder: (context, AllTasks allTasks, child) {return ListView.builder(
        itemBuilder: (context, index) {
          // I could simply get the task object here and get its text and checkbox state simply rather than methods for everything
          return TaskTile(
            // I was actually passing the index to TaskTile just to pass it back here to execute delete
            // I'm facepalming just thinking about what I was thinking when I thought that was a good idea
            text: allTasks.taskTitle(index),
            checkboxState: allTasks.isTaskDone(index),
            // We still follow the rudimentary method for task tile here with task details and toggle method
            // Since our ChangeProvider class gives all tasks, it doesn't make sense to retrieve a single task
            // So task tile remains handled by this widget itself
            // Looking at her solution, she had done the exact same. Guess I'm building some Flutter muscles
            // toggleCheckbox: (v) => Provider.of<AllTasks>(context, listen: false).toggleDone(index),
            toggleCheckbox: (v) => allTasks.toggleDone(index),
            deleteTask: () => allTasks.removeAt(index),
          );
        },
        itemCount: allTasks.length,
      );},
    );
  }
}