import 'package:demo/presentation/sql_data_table/get_data_demo/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> allData = [];
  bool isLoading = true;

  //get all data from database
  void refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      allData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  //add data
  Future<void> _addData() async {
    await SQLHelper.createData(titleController.text, descController.text);
    refreshData();
  }

  //update data
  Future<void> _updateData(int id) async {
    await SQLHelper.upDate(id, titleController.text, descController.text);
    refreshData();
  }

//delete data
  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Data Deleted"),
      ),
    );
    refreshData();
  }

  void showBottomSheet(int? id) {
    //if id is not null then it will update other wise  it will new
    //when edit icon is pressed then id will be given to showModalBottomSheet function and
    //it will edit
    if (id != null) {
      final existingData = allData.firstWhere((element) => element["id"] == id);
      titleController.text = existingData["title"];
      descController.text = existingData["desc"];
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Title",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description",
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (id == null) {
                      await _addData();
                    }
                    if (id != null) {
                      await _updateData(id);
                    }

                    titleController.text = "";
                    descController.text = "";

                    Navigator.of(context).pop();
                    print("Data Added");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Text(
                        id == null ? "Add Data" : "Update Data",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the drawer icon
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "CRUD Operations",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              child: ListView.builder(
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 00),
                        child: Text(
                          "${allData[index]["title"]}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      subtitle: Text("${allData[index]["desc"]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              showBottomSheet(allData[index]["id"]);
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.indigo,
                            ),
                          ),
                          SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              _deleteData(allData[index]["id"]);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ).paddingOnly(top: 10),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
