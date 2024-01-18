import 'package:flutter/material.dart';
import '../models/todo_item.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // Add the key here

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ToDoItem> _todoList = [];
  final _textController = TextEditingController();

  void _addToDoItem(String title) {
    setState(() {
      _todoList.add(ToDoItem(title: title));
    });
    _textController.clear();
  }

  void _removeToDoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  void _toggleToDoItem(int index) {
    setState(() {
      _todoList[index].isDone = !_todoList[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To-Do App'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: 'Enter a new task'),
            onSubmitted: (value) => _addToDoItem(value),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ToDoItemWidget(
                  item: _todoList[index],
                  onDeleteItem: () => _removeToDoItem(index),
                  onToggleisDone: () => _toggleToDoItem(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add New Task'),
                  content: TextField(
                    controller: _textController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel')),
                    TextButton(
                      onPressed: () {
                        if (_textController.text.isNotEmpty) {
                          _addToDoItem(_textController.text);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
