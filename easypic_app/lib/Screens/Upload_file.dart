import 'dart:convert';
import 'dart:io';
import 'package:animated_horizontal_calendar/utils/calender_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_with_signup/Screens/HomePage.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:splashscreen/splashscreen.dart';

import 'User.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File selectedImage;
  var resJson;

  Future<List<User>> listUsers;
  onUploadImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://fakestoreapi.com/products"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    print(res.stream.toString());
    if (res.statusCode == 200) {
      Center(child: Text('Upload'));
    } else {
      print('failed');
      setState(() {
        showSpinner = true;
      });
    }
    http.Response response = await http.Response.fromStream(res);
    setState(() {
      resJson = jsonDecode(response.body);
    });
  }

  Future getImage() async {
    var image = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxHeight: 35,
      maxWidth: 35,
    );

    setState(() {
      selectedImage = File(
        image.path,
      );
    });
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

  int selectedValue = 1;
  bool showSpinner = false;

  // Future getImage() async {
  //   final pickedFile = await ImagePicker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 80);

  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //   } else {
  //     print('no image selected');
  //   }
  // }

  // Future<void> uploadImage() async {
  //   setState(() {
  //     showSpinner = true;
  //   });

  //   var stream = new http.ByteStream(image.openRead());
  //   stream.cast();

  //   var length = await image.length();

  //   var uri = Uri.parse('https://fakestoreapi.com/products');

  //   var request = new http.MultipartRequest('POST', uri);

  //   request.fields['title'] = "Static title";

  //   var multiport = new http.MultipartFile('image', stream, length);

  //   request.files.add(multiport);

  //   var response = await request.send();

  //   print(response.stream.toString());
  //   if (response.statusCode == 200) {
  //     Center(child: Text('Upload'));
  //   } else {
  //     print('failed');
  //     setState(() {
  //       showSpinner = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Image.asset(
                "assets/images/123.png",
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyHomePage()));
              },
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Icon(Icons.location_on, color: Color.fromARGB(255, 96, 8, 1)),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: DropdownButton(
                      alignment: Alignment.center,
                      isDense: true,
                      iconEnabledColor: Color.fromARGB(255, 96, 8, 1),
                      dropdownColor: Color.fromARGB(255, 225, 223, 223),
                      value: selectedValue,
                      items: [
                        DropdownMenuItem(
                          child: InkWell(
                            child: Text("Corp"),
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                            child: Text("CVR-AK-Anchorage"),
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Fairbanks"),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AL-Dothan"),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AL-Fairhope"),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AL-Hoover"),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AL-Mobile"),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AL-Mantgomery"),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AL-Opelika"),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AL-Trussville"),
                          value: 10,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AZ-Gilbert"),
                          value: 11,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AZ-Mesa"),
                          value: 12,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AZ-Phoenix"),
                          value: 13,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-DC1-lrving Street"),
                          value: 14,
                        ),
                        DropdownMenuItem(child: Text("Others"), value: 15),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      }),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.power_settings_new_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginForm()),
                          (Route<dynamic> route) => false),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        body: FutureBuilder<List<User>>(
          future: listUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 7, 0),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      var user = (snapshot.data as List<User>)[index];
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            title: Text(
                              user.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text(
                              user.phone,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                selectedImage == null
                                    ? InkWell(
                                        onTap: getImage,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 18,
                                          child: Icon(
                                            Icons.add_a_photo,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                      )
                                    : Image.file(selectedImage),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 17,
                                    child: Icon(
                                      Icons.cloud_upload_outlined,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                  onTap: onUploadImage,
                                ),
                              ],
                            ),
                          ));
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Text(
                      //       user.name,
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold, fontSize: 20),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         Icon(Icons.man_outlined),
                      //         SizedBox(
                      //           width: 3,
                      //         ),
                      //         CircleAvatar(
                      //           maxRadius: 20,
                      //           backgroundColor:
                      //               Color.fromARGB(255, 210, 208, 208),
                      //           child: IconButton(
                      //               onPressed: () {
                      //                 getImage();
                      //                 // uploadImage();
                      //               },
                      //               icon: Icon(Icons.camera_alt_rounded)),
                      //         ),
                      //       ],
                      //     ),
                      //     Text(
                      //       user.phone,
                      //     ),
                      //     Text(user.email
                      //         // " " +
                      //         // user.address.suite +
                      //         // " " +
                      //         // user.address.city +
                      //         // " " +
                      //         // user.address.zipcode
                      //         ),
                      //   ],
                      // ),
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: (snapshot.data as List<User>).length),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            return SplashScreen(
                seconds: 2,
                useLoader: true,
                loaderColor: Color.fromARGB(255, 1, 53, 96));
          },
        ),
      ),
    );
  }
}
// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 getImage();
//               },
//               child: Container(
//                 child: image == null
//                     ? Center(
//                         child: TextButton(
//                           child: Text("Pick Image"),
//                         ),
//                       )
//                     : Container(
//                         child: Center(
//                           child: Image.file(
//                             File(image.path).absolute,
//                             height: 100,
//                             width: 100,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//               ),
//             ),
//             SizedBox(
//               height: 150,
//             ),
//             GestureDetector(
//               onTap: () {
//                 uploadImage();
//               },
//               child: Container(
//                 height: 50,
//                 width: 200,
//                 color: Colors.green,
//                 child: Center(child: Text('Upload')),
//               ),
//             )
//           ],
//         ),