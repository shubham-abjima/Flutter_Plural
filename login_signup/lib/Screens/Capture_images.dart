import 'package:flutter/material.dart';

class captureImages extends StatefulWidget {
  const captureImages({Key key}) : super(key: key);

  @override
  State<captureImages> createState() => _captureImagesState();
}

class _captureImagesState extends State<captureImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CAPTURE IMAGES"),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 211, 210, 210),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  child:
                      // Your icon here
                      Text(
                    "SAVE",
                    style: TextStyle(color: Colors.black),
                  ), // Your text here
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "APPOINTMENT DATE",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TIME",
                                  style: TextStyle(color: Colors.grey),
                                ),
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
                                "ANTERIOR VIEW",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Container(
                        width: 60,
                        height: 50,
                        color: Color.fromARGB(255, 211, 210, 210),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.photo_camera_outlined,
                                size: 30,
                              ),
                              onTap: () {},
                            ),
                            Text(
                              ("ADD IMAGE"),
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
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
                                "POSTERIOR VIEW",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Container(
                        width: 60,
                        height: 50,
                        color: Color.fromARGB(255, 211, 210, 210),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.photo_camera_outlined,
                                size: 30,
                              ),
                              onTap: () {},
                            ),
                            Text(
                              ("ADD IMAGE"),
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LEFT VIEW",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Container(
                        width: 60,
                        height: 50,
                        color: Color.fromARGB(255, 211, 210, 210),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.photo_camera_outlined,
                                size: 30,
                              ),
                              onTap: () {},
                            ),
                            Text(
                              ("ADD IMAGE"),
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "RIGHT VIEW",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Container(
                        width: 60,
                        height: 50,
                        color: Color.fromARGB(255, 211, 210, 210),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.photo_camera_outlined,
                                size: 30,
                              ),
                              onTap: () {},
                            ),
                            Text(
                              ("ADD IMAGE"),
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ]),
              )),
        ));
  }
}
