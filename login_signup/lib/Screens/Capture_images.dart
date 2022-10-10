import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:login_with_signup/Screens/Appointment.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

class captureImages extends StatefulWidget {
  const captureImages({Key key}) : super(key: key);

  @override
  State<captureImages> createState() => _captureImagesState();
}

class _captureImagesState extends State<captureImages> {
  File image;

  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(
        maxWidth: 50,
        maxHeight: 35,
        source: ImageSource.gallery,
        imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);

      setState(() {});
    } else {
      print('No Image Selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = new http.ByteStream(image?.openRead());
    stream.cast();

    var length = await image.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['title'] = "Static title";

    var multiport = new http.MultipartFile('image', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    print(response.stream.toString());
    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          msg: "Image Uploaded",
        );
      });
      print('Image Uploaded');
    } else {
      print('Failed');

      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    listUsers = fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      var getUsersData = json.decode(response.body) as List;
      var listUsers = getUsersData.map((i) => User.fromJSON(i)).toList();
      return listUsers;
    } else {
      throw Exception('No Records Found');
    }
  }

  bool showSpinner = false;
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
            left: 15,
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                color: Colors.grey,

                onPressed: () {
                  uploadImage();
                },
                child:

                    // Your icon here
                    InkWell(
                  child: Text(
                    "SAVE",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ), // Your text here
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: listUsers,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var user = (snapshot.data as List<User>)[6];
            return SingleChildScrollView(
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
                              Text(user.name),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.phone,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          image == null
                              ? InkWell(
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    size: 30,
                                  ),
                                  onTap: getImage)
                              : Image.file(image),
                          Text(
                            ("ADD IMAGE"),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          image == null
                              ? InkWell(
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    size: 30,
                                  ),
                                  onTap: getImage)
                              : Image.file(image),
                          Text(
                            ("ADD IMAGE"),
                            style: TextStyle(fontSize: 10),
                          )
                        ],
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          image == null
                              ? InkWell(
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    size: 30,
                                  ),
                                  onTap: getImage)
                              : Image.file(image),
                          Text(
                            ("ADD IMAGE"),
                            style: TextStyle(fontSize: 10),
                          )
                        ],
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          image == null
                              ? InkWell(
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    size: 30,
                                  ),
                                  onTap: getImage)
                              : Image.file(image),
                          Text(
                            ("ADD IMAGE"),
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
