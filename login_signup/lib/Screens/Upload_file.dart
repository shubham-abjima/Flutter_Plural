import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File image;
  final _picker = ImagePicker();
  var selectedValue;
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = new http.ByteStream(image.openRead());
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
      });
      print('image uploaded');
    } else {
      print('failed');
      setState(() {
        showSpinner = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/123.png",
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Icon(Icons.location_on, color: Color.fromARGB(255, 96, 8, 1)),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: DropdownButton(
                      isDense: true,
                      iconEnabledColor: Color.fromARGB(255, 96, 8, 1),
                      dropdownColor: Color.fromARGB(255, 225, 223, 223),
                      value: selectedValue,
                      items: [
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Fairbanks"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 10,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 11,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 12,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 13,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 14,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 15,
                        ),
                        DropdownMenuItem(
                          child: Text("CVR-AK-Anchorage"),
                          value: 16,
                        ),
                        DropdownMenuItem(child: Text("Others"), value: 17),
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
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? Center(
                        child: TextButton(
                          child: Text("Pick Image"),
                        ),
                      )
                    : Container(
                        child: Center(
                          child: Image.file(
                            File(image.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
