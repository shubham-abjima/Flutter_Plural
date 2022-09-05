import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqllite_notes/Db_handler.dart';
import 'package:sqllite_notes/Notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper? dbHelper;
  late Future<List<DatabaseModel>> databaselist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    databaselist = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Database SqfLite"),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: FutureBuilder(
                future: databaselist,
                builder:
                    (context, AsyncSnapshot<List<DatabaseModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        reverse: false,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              dbHelper?.update(DatabaseModel(
                                  id: snapshot.data![index].id!,
                                  title: "Database 2",
                                  age: 25,
                                  description: "Will talk to you tomorrow",
                                  email: "abc@gmail.com"));
                              setState(() {
                                databaselist = dbHelper!.getNotesList();
                              });
                            },
                            child: Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                child: Icon(Icons.delete_forever),
                              ),
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  dbHelper!.delete(snapshot.data![index].id!);
                                  databaselist = dbHelper!.getNotesList();
                                  snapshot.data!
                                      .remove(snapshot.data![index].id!);
                                });
                              },
                              key: ValueKey<int>(snapshot.data![index].id!),
                              child: Card(
                                  child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: Text(
                                    snapshot.data![index].title.toString()),
                                subtitle: Text(snapshot.data![index].description
                                    .toString()),
                                trailing:
                                    Text(snapshot.data![index].age.toString()),
                              )),
                            ),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              dbHelper!
                  .insert(DatabaseModel(
                      title: "First Database",
                      age: 22,
                      description: "This Is First Database",
                      email: "xyz@gmail.com"))
                  .then((value) {
                print("Data Added");
                setState(() {
                  databaselist = dbHelper!.getNotesList();
                });
              }).onError((error, stackTrace) {
                print(error.toString());
              });
            },
            child: const Icon(Icons.add)));
  }
}
