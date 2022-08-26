import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_app/screens/Break.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
      create: (context) => TimerModelSec(context),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://media1.giphy.com/media/K7EQ8M8TnuBby/giphy.gif?cid=790b7611df5c3ab42466bd252b7cf44de1192121b6e62fbc&rid=giphy.gif&ct=g"),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Harry Potter",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 80),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Text(
                            " : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Consumer<TimerModelSec>(
                            builder: (context, myModel, child) {
                              return Text(
                                myModel.countdown.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 30,
                    ),
                    Consumer<TimerModelSec>(
                      builder: (context, myModel, child) {
                        return ElevatedButton(
                          onPressed: () {
                            myModel.show();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              "PAUSE",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      },
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Previous",
                                style: TextStyle(fontSize: 16),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Next",
                                style: TextStyle(fontSize: 16),
                              ))
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            "Next: Harry Potter",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
              ),
              Consumer<TimerModelSec>(
                builder: (context, myModel, child) {
                  return Visibility(
                    visible: myModel.visible,
                    child: Center(
                        child: Container(
                      color: Colors.lightBlueAccent.withOpacity(0.8),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PAUSE",
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              child: Container(
                                width: 180,
                                child: Text(
                                  "Restart",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          OutlinedButton(
                              onPressed: () {},
                              child: Container(
                                width: 180,
                                child: Text(
                                  "Quit",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          OutlinedButton(
                            onPressed: () {
                              myModel.hide();
                            },
                            child: Container(
                              width: 180,
                              child: Text(
                                "RESUME",
                                style: TextStyle(color: Colors.lightBlueAccent),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                          )
                        ],
                      ),
                    )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimerModelSec with ChangeNotifier {
  TimerModelSec(context) {
    MyTimerSec(context);
  }
  int countdown = 0;
  bool visible = false;

  MyTimerSec(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown++;
      notifyListeners();
      if (countdown == 30) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Break()));
      }
    });
  }

  void show() {
    visible = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners();
  }
}
