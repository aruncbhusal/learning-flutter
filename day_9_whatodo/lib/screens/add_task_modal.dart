import 'package:flutter/material.dart';
import 'package:whatodo/constants.dart';
import 'package:provider/provider.dart';
import 'package:whatodo/models/task.dart';
import 'package:whatodo/models/all_tasks.dart';

// Since using Provider can rebuild this widget, resetting the title each time, we want to make it stateful
class AddTaskModal extends StatefulWidget {

  const AddTaskModal({super.key});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  String newTaskTitle = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xFF757575),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add a new task',
                style: TextStyle(
                  color: KColorPalette.amethyst,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial'
                ),
              ),
              SizedBox(height: 30),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // When we use listen: false, we don't need to rebuild the widget when the value changes
                  // This is fine here because we're here to add something, not see what changed
                  // Provider.of<AllTasks>(context, listen: false).addTask(Task(title: newTaskTitle));

                  final title = newTaskTitle.trim();
                  if (title.isEmpty) return;

                  // Instead of using Provider.of() we can also use context.read()
                  context.read<AllTasks>().addTask(Task(title: title));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColorPalette.amethyst,
                  minimumSize: Size(double.infinity, 50),
                  disabledBackgroundColor: KColorPalette.lilac,
                ),
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              )
            ],
          )
        ),
      ),
    );
  }
}
