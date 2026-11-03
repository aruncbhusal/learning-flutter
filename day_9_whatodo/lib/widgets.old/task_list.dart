import 'package:flutter/material.dart';
import 'package:whatodo/widgets/task_tile.dart';
import 'package:whatodo/models/task.dart';

// I had taken the liberty of creating a new widget and that's exactly what she did as well
// And we've now taken this into a new file as well, just like the course
// Since it needs to maintain its own state as well, we'll keep it stateful
class TaskList extends StatefulWidget{
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    // We can use a ListView builder here to create a list of task tiles
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          text: widget.tasks[index].title,
          checkboxState: widget.tasks[index].isDone,
          toggleCheckbox: (value){
            // We're not really using the value sent here but we could use it as validation
            // We don't want the checkbox's internal state differing from the state we track here
            if (widget.tasks[index].isDone == value) return; // Inconsistency fixed (minor UX sacrifice for correctness)
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}