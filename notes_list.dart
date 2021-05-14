import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;
  NotesList({this.notes});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: notes[index].color,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notes[index].title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    notes[index].text,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.fit(1);
          },
        ),
      ),
    );
  }
}
