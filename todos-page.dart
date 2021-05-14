import 'package:flutter/material.dart';
import 'package:notes_app/models/todo.dart';
import 'package:notes_app/screens/todo_page.dart';
import 'package:notes_app/widgtes/todos-list.dart';

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  List<ToDo> todos = [
    ToDo(text: 'Learn Flutter'),
    ToDo(text: 'Read about dart'),
    ToDo(text: 'Something to-do'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ToDosList(todos),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: TextButton.icon(
            label: Text(
              'Create New To-Do',
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.check_box),
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => TodoPage((newTaskTitle) {
                  setState(() {
                    todos.add(ToDo(text: newTaskTitle));
                  });
                  Navigator.pop(context);
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
