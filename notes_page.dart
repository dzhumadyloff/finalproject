import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/note_page.dart';
import 'package:notes_app/widgtes/notes_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colors = [
    Color(0xffffffff), // classic white
    Color(0xfff28b81), // light pink
    Color(0xfff7bd02), // yellow
    Color(0xfffbf476), // light yellow
    Color(0xffcdff90), // light green
    Color(0xffa7feeb), // turquoise
    Color(0xffcbf0f8), // light cyan
    Color(0xffafcbfa), // light blue
    Color(0xffd7aefc), // plum
    Color(0xfffbcfe9), // misty rose
    Color(0xffe6c9a9), // light brown
    Color(0xffe9eaee) // light gray
  ];
  Random random = new Random();

  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(12));
  }

  List<Note> notes = [
    Note(
      title: 'Flutter',
      text:
          'Flutter SDK is Google\'s UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
      color: Color(0xffffffff),
    ),
    Note(
      title: 'Dart',
      text:
          'Dart is a client-optimized language for fast apps on any platform.',
      color: Color(0xfff28b81),
    ),
    Note(
      title: 'Birthday Party',
      text: 'Remember to pick up gift for tonight\'s birthday party🎁',
      color: Color(0xfff7bd02),
    ),
    Note(
      title: 'Cool Note',
      text: 'Something you need to keep in mind',
      color: Color(0xfffbf476),
    ),
    Note(
      title: 'Material Design',
      text:
          'Material Design is an Android-oriented design language created by Google, supporting onscreen touch experiences via cue-rich features and natural motions that mimic real-world objects. Designers optimize users experience with 3D effects, realistic lighting and animation features in immersive, platform-consistent GUIs.',
      color: Color(0xffcdff90),
    ),
    Note(
      title: 'Holiday locations list',
      text: '- Bali\n- London\n- Ibiza\n- Los Angeles',
      color: Color(0xffa7feeb),
    ),
    Note(
      title: 'Something Interesting',
      text: 'Make An app that allow take cool interesting notes🥸',
      color: Color(0xffcbf0f8),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: NotesList(notes: notes),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: TextButton.icon(
            label: Text(
              'Create New Note',
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.add_box),
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              changeIndex();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotePage((newTaskTitle, newTaskText) {
                    if (this.mounted) {
                      setState(() {
                        notes.add(
                          Note(
                            title: newTaskTitle,
                            text: newTaskText,
                            color: colors[index],
                          ),
                        );
                      });
                    }
                    Navigator.pop(context);
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
