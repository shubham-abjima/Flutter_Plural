import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies App"),
        backgroundColor: Color.fromARGB(255, 69, 68, 68),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("1"),
                      Text("Streak"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("1"),
                      Text("KCal"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("1"),
                      Text("Minutes"),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              indent: 100,
              endIndent: 100,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text("Yoga For All")),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.grey,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      color: Colors.grey,
                      height: 150,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Yoga For Students"),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.grey,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      color: Colors.grey,
                      height: 150,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
