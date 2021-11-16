// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_list_model.dart';

import 'add_task_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Consumer<TaskListModel>(
        builder: (context, taskList, child) {
          return ListView.builder(
            itemCount: taskList.todos.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(taskList.todos[index].title),
                value: taskList.todos[index].isComplete,
                onChanged: (value) {
                  taskList.updateItemIsCompleteValue(index, value!);
                },
              );
            },
          );
        },
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ));
        },
      ),
    );
  }
}
