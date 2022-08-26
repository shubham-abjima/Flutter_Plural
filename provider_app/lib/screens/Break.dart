import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/screens/Ready.dart';

class Break extends StatelessWidget {
  const Break({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
      create: (context) => TimerModelSec(context),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://th.bing.com/th/id/OIP.jk9ueogbs8xF0ITwgJbxyAHaEK?w=316&h=180&c=7&r=0&o=5&dpr=1.14&pid=1.7"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Break Time",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Consumer<TimerModelSec>(
                builder: (context, myModel, child) {
                  return Text(
                    myModel.countdown.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),
                  );
                },
              ),
              // SizedBox(
              //   height: 15,
              // ),

              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
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
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ))
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      "Next: Harry Potter",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ))
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
  int countdown = 30;

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
}
