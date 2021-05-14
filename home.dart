import 'package:flutter/material.dart';
import 'package:notes_app/screens/notes_page.dart';
import 'package:notes_app/screens/todos-page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.red,
            indicatorWeight: 3,
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.only(bottom: 10),
            tabs: [
              Text(
                'Notes 📝',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'To-Do\'s ✅',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: TabBarView(
          children: [
            HomePage(),
            TodosPage(),
          ],
        ),
      ),
    );
  }
}
