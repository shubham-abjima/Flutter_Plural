import 'package:crudsqf/dbhelper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: Center(
          child: Center(
              child: MyHomePage(
        title: 'CRUD Operation And Material3 Implementation',
      ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;

  final dbhelper = DatabaseHelper.instance;

  TextStyle btnstyle = TextStyle(fontSize: 20, fontFamily: "Verdana");

  void inserdata() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "peter",
      DatabaseHelper.columnAge: 40
    };
    final id = await dbhelper.insert(row);
    print(id);
  }

  void queryall() async {
    var allrows = await dbhelper.queryallrows();
    allrows.forEach((rowval) {
      print(rowval);
    });
  }

  void queryaspecific() async {
    var allrows = await dbhelper.queryspecific(40);
    allrows.forEach((rowval) {
      print(rowval);
    });
  }

  void updatedata() async {
    var row = await dbhelper.update(36);
    print(row);
  }

  void deletedata() async {
    var row = await dbhelper.delete(35);
    print(row);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Copied')));
            },
          )
        ],
        backgroundColor: Colors.red.shade200,
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
              icon: Icon(Icons.chat_outlined),
              label: "Chats",
              selectedIcon: Icon(Icons.chat)),
          NavigationDestination(
              icon: Icon(Icons.person_pin_outlined),
              label: "Profile",
              selectedIcon: Icon(Icons.person))
        ],
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: inserdata,
                child: Text(
                  "Insert",
                  style: btnstyle,
                ),
              ),
              FlatButton(
                onPressed: queryall,
                color: Colors.blue,
                child: Text(
                  "Query",
                  style: btnstyle,
                ),
              ),
              RaisedButton(
                onPressed: queryaspecific,
                color: Colors.grey,
                child: Text(
                  "Query Specific",
                  style: btnstyle,
                ),
              ),
              RaisedButton(
                onPressed: updatedata,
                color: Colors.green,
                child: Text(
                  "Update",
                  style: btnstyle,
                ),
              ),
              RaisedButton(
                onPressed: deletedata,
                color: Colors.orange,
                child: Text(
                  "Delete",
                  style: btnstyle,
                ),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Do You Want To Insert Data ?"),
                    content: Text("Data Will Insert"),
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, onPrimary: Colors.white),
                        onPressed: () {
                          setState(() {
                            inserdata;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Yes"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, onPrimary: Colors.white),
                        onPressed: () {
                          inserdata;
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        child: Text("No"),
                      )
                    ],
                  ));
        },
        label: Text("Insert"),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
