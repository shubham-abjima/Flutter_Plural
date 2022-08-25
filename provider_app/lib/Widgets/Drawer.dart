import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 88, 88, 88),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://static0.cbrimages.com/wordpress/wp-content/uploads/2020/12/star-wars-movies.jpg"),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Reset Progress",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            leading: Icon(
              Icons.restart_alt_sharp,
              size: 25,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Share With Friends",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            leading: Icon(
              Icons.share,
              size: 25,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Rate Us",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            leading: Icon(
              Icons.star_border,
              size: 25,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Feedback",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            leading: Icon(
              Icons.feedback,
              size: 25,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Privacy Policy",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            leading: Icon(
              Icons.security,
              size: 25,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Log Out",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            leading: Icon(
              Icons.logout,
              size: 25,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Divider(
              thickness: 1,
              color: Colors.white,
            ),
          ),
          Text(
            "Version 2.0.0",
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
