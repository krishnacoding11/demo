import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'get_data.dart';

class SqlDataTable extends StatefulWidget {
  const SqlDataTable({Key? key}) : super(key: key);

  @override
  State<SqlDataTable> createState() => _SqlDataTableState();
}

class _SqlDataTableState extends State<SqlDataTable> {
  Database? database;
  @override
  initState() {
    createDB();
    super.initState();
  }

  Future<void> createDB() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'demo.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Test (name TEXT, name TEXT,mobile REAL, age INTEGER,gender TEXT,dob INTEGER)');
        });
  }

  Future<void> insertData(BuildContext context) async {
    await database!.insert("Test", {
      "name": name.text,
      "surname": surname.text,
      "mobile": mobile.text,
      "age": age.text,
      "gender": gender.text,
      "dob": dob.text,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('ADDED')));
  }

  List<Map<String, dynamic>>? data;
  Future<void> getData() async {
    data = await database!.query('Test');

    print('DATA ${data}');
  }

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: name,
                    decoration: const InputDecoration(
                        hintText: "enter name",
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 350,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: surname,
                    decoration: const InputDecoration(
                        hintText: "enter surname",
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 350,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: mobile,
                    decoration: const InputDecoration(
                        hintText: "enter mobile",
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 350,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: age,
                    decoration: const InputDecoration(
                        hintText: "enter age",
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 350,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  TextField(
                    controller: gender,
                    decoration: const InputDecoration(
                        hintText: "enter gender",
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 350,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: dob,
                    decoration: const InputDecoration(
                        hintText: "enter dob",
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 350,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(GetData(data: data!));
                      },
                      child: Text("submit button"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      insertData(context);
                      getData();
                    },
                    child: Text('Add Data'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}