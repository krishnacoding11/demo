import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../const/colors.dart';
import '../widgets/stream_note.dart';
import 'add_note_screen.dart';

class SqlHomeScreen extends StatefulWidget {
  const SqlHomeScreen({super.key});

  @override
  State<SqlHomeScreen> createState() => _SqlHomeScreenState();
}

bool show = true;

class _SqlHomeScreenState extends State<SqlHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
            ));
          },
          backgroundColor: custom_green,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              StreamNote(false),
              Text(
                'isDone',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500, fontWeight: FontWeight.bold),
              ),
              StreamNote(true),
            ],
          ),
        ),
      ),
    );
  }
}
