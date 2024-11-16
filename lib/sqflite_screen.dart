import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteScreen extends StatefulWidget {
  @override
  State<SqfliteScreen> createState() => _SqfliteScreenState();
}

class _SqfliteScreenState extends State<SqfliteScreen> {
  @override
  void initState() {
    intalo();
    super.initState();
  }

  intalo() async {
    await createDataBase();

    await readDataBase();
  }

  Database? database;
  List<Map> list = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (context, index) {
                  return buildItemDataBase(
                      name: list[index]["name"],
                      date: list[index]["date"],
                      time: list[index]["time"],
                      id: list[index]["id"],
                      context: context);
                },
                itemCount: list.length)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            // insertDataBase(
            //     name: "AMIIIIIIIT ", date: "25/10/2024", time: "5:30 AM");

            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      color: Colors.grey.shade50,
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This Filed is Required";
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.title),
                                      contentPadding: EdgeInsets.all(5),
                                      border: OutlineInputBorder(),
                                      hintText: "Tittle"),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: dateController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This Filed is Required";
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.title),
                                      contentPadding: EdgeInsets.all(5),
                                      border: OutlineInputBorder(),
                                      hintText: "Date"),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: timeController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This Filed is Required";
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.title),
                                      contentPadding: EdgeInsets.all(5),
                                      border: OutlineInputBorder(),
                                      hintText: "Time"),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      insertDataBase(
                                          name: nameController.text,
                                          date: dateController.text,
                                          time: timeController.text);
                                    }
                                    nameController.clear();
                                    dateController.clear();
                                    timeController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }

  Future<void> createDataBase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      db.execute('''
             CREATE TABLE tableOne 
            (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT NOT NULL, 
             date TEXT , 
             time TEXT   
             )
          ''').then((value) {
        log("CREATE TABLE Sussess");
      }).catchError((error) {
        log("Error Create TABLE");
      });
    }, onOpen: (Database db) {
      log("Open TABLE");
    });
  }

  Future<void> insertDataBase({
    required String name,
    required String date,
    required String time,
  }) async {
    await database!.rawInsert(
        "INSERT INTO tableOne (name, date, time) VALUES (? , ? , ?)",
        [name, date, time]).then((value) {
      readDataBase();
      setState(() {});
      log(" INSERT Success");
    }).catchError((error) {
      log(" INSERT Error");
    });
  }

  Future<void> readDataBase() async {
    list = await database!.rawQuery('SELECT * FROM tableOne');
    log("${list[0]['name']}");
    setState(() {});
  }

  void updateDataBase({
    required String name,
    required String date,
    required String time,
    required int id,
  }) async {
    await database!.rawUpdate(
        'UPDATE tableOne SET name = ?, date = ? , time = ? WHERE id = ?',
        [name, date, time, id]);
    readDataBase();
    setState(() {});
  }

  void deleteDataBase(int id) async {
    await database!.rawDelete('DELETE FROM tableOne WHERE id = ?', [id]);
    readDataBase();
    setState(() {});
  }


  Widget buildItemDataBase(
      {required String name,
      required String date,
      required String time,
      required int id,
      required BuildContext context}) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.insert_drive_file),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "$id",
                      style: const TextStyle(color: Colors.green, fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(Icons.title),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      name,
                      style: const TextStyle(color: Colors.green, fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.green, fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(Icons.watch_later_outlined),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.green, fontSize: 22),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      nameController.text = name;
                      dateController.text = date;
                      timeController.text = time;
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                color: Colors.grey.shade50,
                                child: Form(
                                  key: formKey,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: nameController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "This Filed is Required";
                                              }
                                            },
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.title),
                                                contentPadding:
                                                    EdgeInsets.all(5),
                                                border: OutlineInputBorder(),
                                                hintText: "Tittle"),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: dateController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "This Filed is Required";
                                              }
                                            },
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.title),
                                                contentPadding:
                                                    EdgeInsets.all(5),
                                                border: OutlineInputBorder(),
                                                hintText: "Date"),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: timeController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "This Filed is Required";
                                              }
                                            },
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.title),
                                                contentPadding:
                                                    EdgeInsets.all(5),
                                                border: OutlineInputBorder(),
                                                hintText: "Time"),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                updateDataBase(
                                                    id: id,
                                                    name: nameController.text,
                                                    date: dateController.text,
                                                    time: timeController.text);
                                              }
                                              nameController.clear();
                                              dateController.clear();
                                              timeController.clear();
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.all(10),
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      deleteDataBase(id);
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ))
              ],
            )
          ],
        ));
  }
}
