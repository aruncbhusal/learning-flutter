import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whatodo/constants.dart';
import 'package:whatodo/widgets/task_list.dart';
import 'package:whatodo/screens/add_task_modal.dart';
import 'package:whatodo/models/all_tasks.dart';

// Since we're using Provider, we don't even need a Stateful widget here
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            // Since we simply use provider inside the modal, we don't need to pass anything here
            builder: (context) => AddTaskModal(),
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
                    // Text(
                    //   // Rather than having the length logic here, I thought I'd keep it confined inside the class
                    //   '${Provider.of<AllTasks>(context).length} Tasks',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white70,
                    //   ),
                    // )
                    // Since we only call provider here once for this small element, rebuilding this entire widget for it
                    // is not very optimal for performance. We can instead create a consumer here
                    Consumer<AllTasks>(
                      builder: (context, AllTasks allTasks, child) {
                        return Text(
                          '${allTasks.length} Tasks',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                    )
                  ),
                  // Similarly, we need not pass the task list as a prop here
                  child: TaskList(),
                ),
              )
            ]
          )
    );
  }
}