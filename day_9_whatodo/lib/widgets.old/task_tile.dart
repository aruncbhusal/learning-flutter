import 'package:flutter/material.dart';
import 'package:whatodo/constants.dart';

// We've made this widget Stateless since the TaskList is now Stateful
class TaskTile extends StatelessWidget {
  final String text;
  // We need to track the state of the checkbox
  final bool checkboxState;
  final void Function(bool?) toggleCheckbox;

  const TaskTile({super.key, required this.text, required this.checkboxState, required this.toggleCheckbox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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

// Since the checkbox itself is a dynamic part of the app, let's create a stateful widget for it
// but as we've made task tile itself stateful, we can simply have it stateless
// Nevermind, the checkbox is simply too small a widget to be left alone, so we'll merge it above
// class TaskCheckbox extends StatelessWidget {
// }



// I had made a list item by myself as well, but the course pivoted to ListTile so I thought I may as well use that
// class ListItem extends StatefulWidget {
//   const ListItem({super.key, required this.text, required this.completed});
//   final String text;
//   final bool completed;
//
//   @override
//   State<ListItem> createState() => _ListItemState(completed);
// }
//
// class _ListItemState extends State<ListItem> {
//   _ListItemState(this.completed);
//
//   bool completed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           widget.text,
//           style: kListItemTextStyle.copyWith(
//             decoration: completed ? TextDecoration.lineThrough : null,
//           ),
//         ),
//         Checkbox(
//           value: completed,
//           onChanged: (value) {
//             setState(() {
//               completed = value!;
//             });
//           },
//         )
//       ],
//     );
//   }
// }
