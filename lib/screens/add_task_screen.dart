// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/provider/task_list_model.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();

  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new task'),
        actions: [
          IconButton(
            onPressed: () {
              Todo newTodo = Todo(
                title: _titleController.text,
                details: _detailsController.text,
              );

              Provider.of<TaskListModel>(context, listen: false)
                  .addItem(newTodo);
              Navigator.pop(context);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _titleController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter task title',
            ),
          ),
          TextFormField(
            controller: _detailsController,
            decoration: InputDecoration(
              hintText: 'Enter task details here (optional)',
            ),
          )
        ],
      ),
    );
  }
}
