import 'package:flutter/material.dart';



class MyAppDemo extends StatefulWidget {
  const MyAppDemo({super.key});

  @override
  State<MyAppDemo> createState() => _MyAppDemoState();
}

class _MyAppDemoState extends State<MyAppDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Properties Example'),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            width: 70,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            transform: Matrix4.rotationZ(0.1),
            constraints: BoxConstraints(
              // minWidth: 100,
              // minHeight: 100,
              // maxWidth: 300,
              // maxHeight: 300,
            ),
            child: Text(
              'Hello, Container!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
