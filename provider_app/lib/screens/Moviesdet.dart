import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_app/DatabaseServices/localdb.dart';
import 'package:provider_app/Model/model.dart';
import 'package:provider_app/screens/Break.dart';
import 'package:provider_app/screens/Complete.dart';

class MoviesDet extends StatelessWidget {
  List<Movie> ListOfMovies;
  int movieindex;

  MoviesDet({
    required this.ListOfMovies,
    required this.movieindex,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
      create: (context) => TimerModelSec(context, ListOfMovies, movieindex + 1,
          ListOfMovies[movieindex].SecondsOrTimes),
      child: Consumer<TimerModelSec>(builder: (context, myModel, child) {
        return WillPopScope(
          onWillPop: () async {
            myModel.show();
            return true;
          },
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                ListOfMovies[movieindex].MovieImageUrl),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          ListOfMovies[movieindex].MovieTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 80),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(50)),
                          child: ListOfMovies[movieindex].Seconds
                              ? Row(
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
                                          myModel.countdown.toString().length ==
                                                  1
                                              ? "0" +
                                                  myModel.countdown.toString()
                                              : myModel.countdown.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white),
                                        );
                                      },
                                    )
                                  ],
                                )
                              : Text(
                                  "x${ListOfMovies[movieindex].SecondsOrTimes}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white),
                                )),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: const Text(
                                    "Pause",
                                    style: TextStyle(fontSize: 20),
                                  )));
                        },
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            movieindex != 0
                                ? Consumer<TimerModelSec>(
                                    builder: (context, myModel, child) {
                                    return TextButton(
                                        onPressed: () async {
                                          myModel.Pass();
                                          await Future.delayed(
                                              Duration(seconds: 1));
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Break(
                                                      ListOfMovies:
                                                          ListOfMovies,
                                                      movieindex:
                                                          movieindex - 1)));
                                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WorkOutDet(ListOfYoga: ListOfYoga, yogaindex: yogaindex-1)));
                                        },
                                        child: Text(
                                          "Previous",
                                          style: const TextStyle(fontSize: 16),
                                        ));
                                  })
                                : Container(),
                            movieindex != ListOfMovies.length - 1
                                ? Consumer<TimerModelSec>(
                                    builder: (context, myModel, child) {
                                    return TextButton(
                                        onPressed: () async {
                                          myModel.Pass();
                                          await Future.delayed(
                                              Duration(seconds: 1));
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Break(
                                                      ListOfMovies:
                                                          ListOfMovies,
                                                      movieindex:
                                                          movieindex + 1)));
                                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WorkOutDet(ListOfYoga: ListOfYoga, yogaindex: yogaindex+1)));
                                        },
                                        child: Text(
                                          "Next",
                                          style: TextStyle(fontSize: 16),
                                        ));
                                  })
                                : Container()
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              "Next: ${movieindex >= ListOfMovies.length - 1 ? "Finish" : ListOfMovies[movieindex + 1].MovieTitle}",
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
                        child: Container(
                          color: Colors.blueAccent.withOpacity(0.9),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Pause",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Yoga feels better",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MoviesDet(
                                                ListOfMovies: ListOfMovies,
                                                movieindex: 0,
                                              )));
                                },
                                child: const SizedBox(
                                  width: 180,
                                  child: Text(
                                    "Restart",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
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
                                  child: const Text(
                                    "Resume",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                              )
                            ],
                          ),
                        ));
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class TimerModelSec with ChangeNotifier {
  TimerModelSec(context, List<Movie> ListOfMovies, int movieindex, countdown) {
    setCDownValue(int.parse(countdown), ListOfMovies[movieindex - 1].Seconds);
    CheckIfLast(movieindex >= ListOfMovies.length - 1);
    MyTimerSec(context, ListOfMovies, movieindex);
    ReadTime(movieindex);
  }
  int countdown = 0;
  bool isLast = false;

  void ReadTime(int movieindex) {
    print(movieindex);
    if (movieindex == 1) {
      String now = DateTime.now().toString();
      LocalDB.setStartTime(now);
    }
  }

  void CheckIfLast(bool Ans) {
    isLast = Ans;
  }

  void setCDownValue(int count, bool isSec) {
    countdown = isSec ? count : 10000;
  }

  bool visible = false;
  bool isPassed = false;

  MyTimerSec(context, List<Movie> ListOFMovies, int movieindex) async {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      visible ? countdown + 0 : countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        isLast
            ? Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Complete()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Break(
                        ListOfMovies: ListOFMovies, movieindex: movieindex)));
      } else if (isPassed) {
        timer.cancel();
      }
    });
  }

  void show() {
    visible = true;
    notifyListeners();
  }

  void Pass() {
    isPassed = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners();
  }
}
