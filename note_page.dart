import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  final Function addNoteCallBack;
  NotePage(this.addNoteCallBack);
  @override
  Widget build(BuildContext context) {
    String newNoteTitle;
    String newNoteText;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Note'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note title',
                  ),
                  onChanged: (newTitle) {
                    newNoteTitle = newTitle;
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: SingleChildScrollView(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 100,
                      autofocus: true,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Note text',
                        border: InputBorder.none,
                      ),
                      onChanged: (newText) {
                        newNoteText = newText;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  onPressed: () {
                    addNoteCallBack(newNoteTitle, newNoteText);
                  },
                  child: Text(
                    'Add Note',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
