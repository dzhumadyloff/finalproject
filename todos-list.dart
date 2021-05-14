import 'package:flutter/material.dart';
import 'package:notes_app/models/todo.dart';
import 'package:notes_app/widgtes/todo_tile.dart';

class ToDosList extends StatefulWidget {
  final List<ToDo> tasks;

  ToDosList(this.tasks);
  @override
  _ToDosListState createState() => _ToDosListState();
}

class _ToDosListState extends State<ToDosList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ToDoTile(
            taskTitle: widget.tasks[index].text,
            isChecked: widget.tasks[index].isDone,
            checkBoxCallBack: (checkBoxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
