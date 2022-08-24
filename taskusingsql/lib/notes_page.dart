import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:core';
import 'package:taskusingsql/edit_notepage.dart';
import 'package:taskusingsql/note.dart';
import 'package:taskusingsql/note_card_widget.dart';
import 'package:taskusingsql/note_database.dart';
import 'package:taskusingsql/note_detailpage.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = (await NotesDatabase.instance.readAllNotes()).cast<Note>();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Notes',
            style: TextStyle(fontSize: 24),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? Text(
                      'No Notes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () async {
            // showDialog(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //           title: Text("Do You Wants To Save ?"),
            //           content: Text("Data Will Insert"),
            //           actions: <Widget>[
            //             ElevatedButton(
            //               style: ElevatedButton.styleFrom(
            //                   primary: Colors.red, onPrimary: Colors.white),
            //               onPressed: () {
            //                 setState(() {});
            //                 Navigator.of(context).pop();
            //               },
            //               child: Text("Yes"),
            //             ),
            //             ElevatedButton(
            //               style: ElevatedButton.styleFrom(
            //                   primary: Colors.red, onPrimary: Colors.white),
            //               onPressed: () {
            //                 setState(() {});
            //                 Navigator.of(context).pop();
            //               },
            //               child: Text("No"),
            //             )
            //           ],
            //         ));
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
