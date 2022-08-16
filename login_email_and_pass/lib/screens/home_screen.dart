import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 73, 73),
        title: Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.network(
                  'https://seeklogo.com/images/F/Ford_Motor_Company-logo-CCFFCF5685-seeklogo.com.png',
                  fit: BoxFit.contain,
                ),
              ),
              Text("Welcome Back"),
              SizedBox(
                height: 10,
              ),
              Text("Name"),
              Text("Email"),
              SizedBox(
                height: 20,
              ),
              ActionChip(label: Text("Logout"), onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
