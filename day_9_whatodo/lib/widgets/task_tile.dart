import 'package:flutter/material.dart';
import 'package:whatodo/constants.dart';

// TaskTile is a presentation widget. Its parent supplies the data and callbacks.
class TaskTile extends StatelessWidget {
  final String text;
  final bool checkboxState;
  final void Function(bool?) toggleCheckbox;
  final void Function() deleteTask;

  const TaskTile({super.key,required this.text, required this.checkboxState, required this.toggleCheckbox, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    // I had wrapped the ListTile with a GestureDetector to handle the long press event
    // but turns out ListTile has its own long press event handler
      return ListTile(
        onLongPress: () => deleteTask(),
        title: Text(text, style: kListItemTextStyle.copyWith(
          decoration: checkboxState ? TextDecoration.lineThrough : null,
        )),
        trailing: Checkbox(
          value: checkboxState,
          onChanged: toggleCheckbox,
        ),
      );
  }
}