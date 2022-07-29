import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floor/floor.dart';
import 'package:flutter29july/pages/home_page.dart';

//Entitiy we can store anywhere in the project file
// @entity
// class Todo {
//   @PrimaryKey(autoGenerate: true)
//   final int id;
//   final String task;
//   final String time;
//   final String scheduleTime;
//   @ignore
//   bool isSelect = false;
//   Todo(this.id, this.task, this.time, this.scheduleTime);
// }

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://www.bing.com/th?id=OIP.5uG-SqxLLeH1sMvYVEjX3AHaJ4&w=154&h=206&c=8&rs=1&qlt=90&o=6&dpr=1.14&pid=3.1&rm=2";
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName:
                    Text("Shubham", style: TextStyle(color: Colors.white)),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 72, 71, 71)),
                accountEmail: Text("Shubham.khandelwal@abjima.com",
                    style: TextStyle(color: Colors.white)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ))),
        ListTile(
          onTap: (){
            
          },
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.black,
          ),
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.profile_circled,
            color: Colors.black,
          ),
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.mail,
            color: Colors.black,
          ),
          title: Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.settings,
            color: Colors.black,
          ),
          title: Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ]),
    );
  }
}
