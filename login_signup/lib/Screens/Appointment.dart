import "package:flutter/material.dart";
import 'package:login_with_signup/Screens/User.dart';

Future<List<User>> listUsers;

class Appointment extends StatelessWidget {
  const Appointment({Key key}) : super(key: key);
  // List<User> postList = [];

  // Future<List<User>> getPostApi() async {
  //   String url = 'https://jsonplaceholder.typicode.com/posts';
  //   final resposne = await http.get(Uri.parse(url));
  //   var data = jsonDecode(resposne.body.toString());
  //   if (resposne.statusCode == 200) {
  //     postList.clear();
  //     for (Map i in data) {
  //       postList.add(User.fromJSON(i));
  //     }
  //     return postList;
  //   } else {
  //     return postList;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointment Info",
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: listUsers,
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var user = (snapshot.data as List<User>)[5];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(user.name),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "APPOINTMENT DATE",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("26/09/2022")
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TIME",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text("07:45-08:00")
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ENC NUMBER",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("0")
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "EVENT",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text("Proc-Post Ablation FU Scan")
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DATE OF BIRTH",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("17/04/1985")
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 150,
                            child: Column(
                              children: [
                                Text(
                                  "RACE",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text("White")
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ("ANTERIOR VIEW"),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Image.network(
                            "https://s3-media1.fl.yelpcdn.com/bphoto/Y8LxQSYU-RImSWA1x0B5-Q/o.jpg",
                            fit: BoxFit.contain,
                            height: 70,
                            width: 80,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ("POSTERIOR VIEW"),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Image.network(
                            "https://s3-media1.fl.yelpcdn.com/bphoto/Y8LxQSYU-RImSWA1x0B5-Q/o.jpg",
                            fit: BoxFit.contain,
                            height: 70,
                            width: 80,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ("LEFT VIEW"),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Image.network(
                            "https://s3-media1.fl.yelpcdn.com/bphoto/Y8LxQSYU-RImSWA1x0B5-Q/o.jpg",
                            fit: BoxFit.contain,
                            height: 70,
                            width: 80,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ("RIGHT VIEW"),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Image.network(
                            "https://s3-media1.fl.yelpcdn.com/bphoto/Y8LxQSYU-RImSWA1x0B5-Q/o.jpg",
                            fit: BoxFit.contain,
                            height: 80,
                            width: 80,
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
