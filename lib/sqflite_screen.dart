// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/sqflite/model.dart';
import 'package:flutter_application_1/sqflite/sqflite.dart';

class SqfliteScreen extends StatefulWidget {
  const SqfliteScreen({super.key});

  @override
  State<SqfliteScreen> createState() => _SqfliteScreenState();
}

class _SqfliteScreenState extends State<SqfliteScreen> {
  var dbHelper = DataBaseHelper.dataBaseHelper;

  @override
  void initState() {
    intalo();
    super.initState();
  }

  intalo() async {
    dbHelper.createDataBase();
    getAllData();
  }

  getAllData() async {
    list = (await dbHelper.getAllProductInCart())!;
    setState(() {});
  }

  List<TaskModel> list = [];
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
      body: list.isEmpty
          ? Center(child: Image.asset("assets/no_image.jpg"))
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return buildItemDataBase(
                            taskModel: list[index], context: context);
                      },
                      itemCount: list.length)
                ],
              ),
            ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
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
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SingleChildScrollView(
                                child: Column(
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
                                        return null;
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
                                        return null;
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
                                        return null;
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
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          await dbHelper.insertDataBase(
                                              taskModel: TaskModel(
                                                  name: nameController.text,
                                                  date: dateController.text,
                                                  time: timeController.text));
                                          getAllData();
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
              }),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: () async {
              await dbHelper.deleteAllTasks();
              getAllData();
            },
            child: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Widget buildItemDataBase(
      {required TaskModel taskModel, required BuildContext context}) {
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
                    const Icon(Icons.title),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${taskModel.name}",
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
                      "${taskModel.date}",
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
                      "${taskModel.time}",
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
                      nameController.text = taskModel.name.toString();
                      dateController.text = taskModel.date.toString();
                      timeController.text = taskModel.time.toString();
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
                                              return null;
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
                                              return null;
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
                                              return null;
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
                                            onTap: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                await dbHelper.updateTask(
                                                    TaskModel(
                                                        id: taskModel.id,
                                                        name:
                                                            nameController.text,
                                                        date:
                                                            dateController.text,
                                                        time: timeController
                                                            .text));
                                              }
                                              nameController.clear();
                                              dateController.clear();
                                              timeController.clear();
                                              Navigator.pop(context);
                                              getAllData();
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
                    onPressed: () async {
                      await dbHelper.deleteTask(taskModel);
                      getAllData();
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
