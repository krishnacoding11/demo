import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key, required this.data}) : super(key: key);
  final List<Map<String, dynamic>> data;

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  Database? database;

  Future<void> createDB() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'demo.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute('''
CREATE TABLE IF NOT EXISTS users (
  name VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  mobile VARCHAR(10) NOT NULL UNIQUE,
  age INT NOT NULL,
  gender VARCHAR(255) NOT NULL,
  dob DATE NOT NULL
);
''');
        });
  }

  List<Map<String, dynamic>>? data;
  Future<void> getData() async {
    data = await database!.query('Test');

    print('DATA ${data}');
  }

  @override
  Widget build(BuildContext context) {
    var datalength = widget.data.first.keys.toList();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: List.generate(
                datalength.length,
                    (index) => DataColumn(
                  label: Text("${widget.data[index]}"),
                ),
              ),
              rows: List.generate(
                datalength.length,
                    (index) => DataRow(
                  cells: List.generate(
                    datalength.length,
                        (index1) => DataCell(
                      Text("${widget.data[index]["${widget.data[index1]}"]}"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}