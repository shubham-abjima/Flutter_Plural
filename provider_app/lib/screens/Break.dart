import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_app/Model/model.dart';

import 'package:provider_app/screens/Moviesdet.dart';
import 'package:provider_app/screens/Ready.dart';

class Break extends StatelessWidget {
  List<Movie> ListOfMovies;
  int movieindex;

  Break({required this.ListOfMovies, required this.movieindex});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
        create: (context) => TimerModelSec(context, ListOfMovies, movieindex),
        child: Consumer<TimerModelSec>(builder: (context, myModel, mychild) {
          return WillPopScope(
            onWillPop: () async {
              myModel.show();
              return false;
            },
            child: Scaffold(
                body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                      SizedBox(
                        height: 25,
                      ),
                      Consumer<TimerModelSec>(
                          builder: (context, myModel, child) {
                        return ElevatedButton(
                          onPressed: () {
                            myModel.skip();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Text(
                              "SKIP",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        );
                      }),
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
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
                                              const Duration(seconds: 1));
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
                                        child: const Text(
                                          "Previous",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
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
                                              const Duration(seconds: 1));
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
                                        child: const Text(
                                          "Next",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ));
                                  })
                                : Container()
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              "Next: ${movieindex >= ListOfMovies.length - 1 ? "FINISH" : ListOfMovies[movieindex].MovieTitle}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
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
            )),
          );
        }));
  }
}

class TimerModelSec with ChangeNotifier {
  TimerModelSec(context, List<Movie> ListOfMovies, int movieindex) {
    MyTimerSec(context, ListOfMovies, movieindex);
  }
  int countdown = 10;
  bool isPassed = false;
  bool visible = false;
  bool Isskip = false;

  MyTimerSec(context, List<Movie> ListOfMovies, int movieindex) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      visible ? countdown+0 : countdown--;
      notifyListeners();
      if (countdown == 0 || Isskip) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MoviesDet(ListOfMovies: ListOfMovies, movieindex: 0),
          ),
        );
      } else if (isPassed) {
        timer.cancel();
      }
    });
  }

  void skip() {
    Isskip = true;
    notifyListeners();
  }

  void show() {
    visible = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners(); 
  }

  void Pass() {
    isPassed = true;
    notifyListeners();
  }
}
