import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_app/DatabaseServices/Moviedb.dart';
import 'package:provider_app/Model/model.dart';

import 'package:provider_app/screens/Moviesdet.dart';

class Ready extends StatelessWidget {
  String MovieTableName;
  Ready({required this.MovieTableName});

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  var list = [
    'Create a comfortable spot for your yoga practice',
    'Yoga can ease arthritis symptoms.',
    'Yoga benefits heart health.',
    'Yoga relaxes you, to help you sleep better.',
    'Yoga can mean more energy and brighter moods.',
    'Yoga helps you manage stress.'
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context, MovieTableName: MovieTableName),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 - 100,
                ),
                Text(
                  "ARE YOU READY?",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Consumer<TimerModel>(builder: (context, myModel, child) {
                  return Text(
                    myModel.countdown.toString(),
                    style: TextStyle(fontSize: 48),
                  );
                }),
                Spacer(),
                Divider(
                  thickness: 2,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 18),
                      child: Text(
                        "Tip:" + getRandomElement(list),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier {
  String MovieTableName;
  TimerModel(context, {required this.MovieTableName}) {
    FetchAllMovies(MovieTableName);
    MyTimer(context);
  }
  int countdown = 5;
  late List<Movie> AllMovies;
  MyTimer(context) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      if (countdown == 0) {
        timer.cancel();
        // timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MoviesDet(ListOfMovies: AllMovies, movieindex: 0)));
      }
      notifyListeners();
    });
  }

  Future<List<Movie>> FetchAllMovies(String yogaTableName) async {
    await MoviesDatabase.instance.readAllMovieSum();
    AllMovies = (await MoviesDatabase.instance.readAllMovie(MovieTableName))
        .cast<Movie>();

    notifyListeners();
    return AllMovies;
  }
}
