import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider_app/DatabaseServices/localdb.dart';
import 'package:provider_app/screens/MyHomepage.dart';
import 'package:provider_app/screens/Splash_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  Future<void> shareApp() async {
    await FlutterShare.share(
        title: 'Hey I am using Yoga For Beginners App',
        text:
            'Hey I am using Yoga For Beginners App. It has best yoga workout for all age groups. You should try it once.',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('RESET PROGRESS'),
                        actionsAlignment: MainAxisAlignment.center,
                        actionsPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        content: Text(
                            'This will reset all of your fitness data including Total Workout Time, Streak and Burned Calories. The action cannot be revert once done.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 35))),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await LocalDB.setWatchTime(0);
                              await LocalDB.setMovieTime(0);
                              await LocalDB.setStreak(0);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SplashScreen()));
                            },
                            child: Text(
                              "Reset",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 35))),
                          )
                        ],
                      ));
            },
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
            onTap: shareApp,
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
            onTap: () async {
              await launchUrl(Uri.parse(
                  "https://play.google.com/store/apps/details?id=com.dhruv.aiem"));
            },
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
            onTap: () async {
              
              await launchUrl(Uri.parse(
                  "https://sites.google.com/view/yogaforbeginners-indianyoga/privacy-policy"));
            },
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
              onTap: () => Navigator.pushReplacementNamed(context, "/")),
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
