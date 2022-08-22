import 'package:crudsqf/dbhelper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
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

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Do You Want To Insert Data ?"),
                    content: Text("Data Will Insert"),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            inserdata;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Yes"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            inserdata;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("No"),
                      )
                    ],
                  ));
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
