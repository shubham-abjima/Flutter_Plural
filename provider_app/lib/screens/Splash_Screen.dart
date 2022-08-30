import 'package:flutter/material.dart';
import 'package:provider_app/DatabaseServices/Moviedb.dart';
import 'package:provider_app/DatabaseServices/localdb.dart';
import 'package:provider_app/Model/model.dart';
import 'package:provider_app/screens/MyHomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future makeMovieEntry(Movie movie, String TableName) async {
    await MoviesDatabase.instance.Insert(movie, TableName);
  }

  Future makeMovieSumEntry(AllMovies allMovies) async {
    await MoviesDatabase.instance.InsertMovieSum(allMovies);
  }

  checkUp() async {
    await LocalDB.getFirstTime().then((value) async {
      if (value.toString() == "null" || value != false) {
        print("First Time Entering");
        await LocalDB.setStreak(0);
        await LocalDB.setLastDoneOn(
            DateTime.now().subtract(Duration(days: 1)).toString());
        await LocalDB.setWatchTime(0);
        await LocalDB.setMovieTime(0);
        await LocalDB.setFirstTime(false);

        // CREATING ONE YOGA WORKOUT PACK
        makeMovieSumEntry(AllMovies(
            MovieKey_all: MoviesModel.Moviesforall1,
            BackImg: "assets/01_Suryanamskar/main.jpg",
            TimeTaken: "6",
            TotalNoOfMovies: "12",
            MovieKey: 1));
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
        makeMovieEntry(
          Movie(
              Seconds: true,
              MovieImageUrl: "assets/01_Suryanamskar/1.png",
              MovieTitle: "Pranamasana (Prayer pose)",
              SecondsOrTimes: '15',
              MovieKey_all: 1),
          MoviesModel.Moviesforall1,
        );
      } else {
        print("NOT A FIRST TIME");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUp();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    //CHECK INSTALLATION,INSERT,READ,UPDATE,OPERATION STATUS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/logo/yoga_trasparent.png")),
    );
  }
}
