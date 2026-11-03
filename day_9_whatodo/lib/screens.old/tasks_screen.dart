import 'package:flutter/material.dart';
import 'package:whatodo/constants.dart';

import 'package:whatodo/widgets/task_list.dart';
import 'package:whatodo/screens/add_task_modal.dart';
import 'package:whatodo/models/task.dart';

class TasksScreen extends StatefulWidget {

  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(title: 'Buy milk', isDone: true),
    Task(title: 'Buy eggs', isDone: true),
    Task(title: 'Buy bread', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    // We should return a scaffold where the content of the screen lives
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // We must show the modal when the button is pressed
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskModal(
                (String title){
                  setState(() {
                    tasks.add(Task(title: title,));
                  });
                  Navigator.pop(context);
                }
            ),
          );
        },
        backgroundColor: KColorPalette.lilac,
        child: Icon(Icons.add),
      ),
      backgroundColor: KColorPalette.velvetPurple,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/logo_notext_lowres.png'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Wha',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Todo',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: KColorPalette.bananaCream,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${tasks.length} Tasks',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // okay now the ListView inside here is a challenge left for us so let's do it and add some tasks
                  // I'll create a stateful widget for it maybe
                  decoration: BoxDecoration(
                    // The normal color property for Container is just a shorthand for this:
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                    )
                  ),
                  child: TaskList(tasks: tasks),
                ),
              )
            ]
          )
    );
  }
}

// Since we're going to use Provider to handle states, much of this will have to change
// Maybe I'll just clone the screens and widgets folders and have them begin clean wrt state management