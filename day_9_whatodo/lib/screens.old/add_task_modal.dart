import 'package:flutter/material.dart';
import 'package:whatodo/constants.dart';
import 'package:whatodo/models/task.dart';

class AddTaskModal extends StatelessWidget {
  final void Function(String) addTaskCallback;

  const AddTaskModal(this.addTaskCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    // I had forgotten that we could also define variables inside a function, not just as class properties
    String newTaskTitle = '';

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        // Since we can't change the modal's borders, we can use a trick instead
        // We nest the actual container inside a Container with background color blending with the inactive app
        // Then the inner Container can have rounded borders if we want
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
                onPressed: () => addTaskCallback(newTaskTitle.trim()),
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
