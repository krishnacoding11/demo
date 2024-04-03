import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/presentation/screen/toDo_list_with_firebase/widgets/task_widgets.dart';
import 'package:flutter/material.dart';

import '../data/fire_store.dart';

class StreamNote extends StatelessWidget {
  bool done;
  StreamNote(this.done, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore_Datasource().stream(done),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final noteslist = Firestore_Datasource().getNotes(snapshot);
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final note = noteslist[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  Firestore_Datasource().delet_note(note.id);
                },
                child: TaskWidgetScreen(note),
              );
            },
            itemCount: noteslist.length,
          );
        });
  }
}
