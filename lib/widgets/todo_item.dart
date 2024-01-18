import 'package:flutter/material.dart';
import '../models/todo_item.dart';

class ToDoItemWidget extends StatelessWidget {
  final ToDoItem item;
  final VoidCallback onDeleteItem; // Callback for deletion
  final VoidCallback onToggleisDone; // Callback for toggling state

  const ToDoItemWidget({
    Key? key,
    required this.item,
    required this.onDeleteItem,
    required this.onToggleisDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      leading: Checkbox(
        value: item.isDone,
        onChanged: (bool? newValue) {
          if (newValue != null) {
            onToggleisDone();
          }
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDeleteItem,
      ),
    );
  }
}
