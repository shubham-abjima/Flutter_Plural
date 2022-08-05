import 'package:flutter/material.dart';

import 'floordb/AppDatabase.dart';
import 'floordb/entity/Person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> items = [];
  TextEditingController userInput = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController userfindController = TextEditingController();

  Future<void> _addUser() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final personDao = database.personDao;
    final person =
        Person(int.parse(userIdController.value.text), userInput.value.text);
    await personDao.insertPerson(person);
    _getAllUser();
  }

  Future<void> _getUser() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final personDao = database.personDao;
    final result =
        personDao.findPersonById(int.parse(userfindController.value.text));
    result.first.then((value) => ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${value!.name} found"))));
  }

  Future<void> _updateUser() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final personDao = database.personDao;
    final person =
        personDao.updatePersonById(int.parse(userIdController.value.text));
  }

  // Future<void> _updateUser() async {
  //   final database =
  //       await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  //   final personDao = database.personDao;
  //   final result =
  //       personDao.updatePersonById(int.parse(userfindController.value.text));
  //   result.then((value) => ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("${value!.name} Updated"))));
  // }

  Future<void> _getAllUser() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final personDao = database.personDao;
    final allUsers = await personDao.findAllPersons();

    setState(() {
      items = allUsers;
    });
    ;
  }

  Future<void> _deleteUser() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final personDao = database.personDao;
    personDao.deleteById(int.parse(userfindController.value.text));

    _getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.deepPurple,
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
            child: const Text(
          "Floor Demo",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userIdController,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'User Id',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userInput,
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Divider(
                height: 25,
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Get User by Id",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: userfindController,
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Enter User Id',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _getUser();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text("Get User"),
                ),
              ),
              const Divider(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  _deleteUser();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text("Delete User"),
                ),
              ),
              const Divider(height: 25),
              ElevatedButton(
                onPressed: () {
                  _updateUser();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text("Update User"),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          items[index].id.toString() + " " + items[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ));
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
    );
  }
}
