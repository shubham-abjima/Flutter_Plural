import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider_app/DatabaseServices/Moviedb.dart';
import 'package:provider_app/Model/model.dart';
import 'package:provider_app/Widgets/CustomAppBar.dart';
import 'package:provider_app/Widgets/Drawer.dart';
import 'package:provider_app/screens/StartUp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _colorTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textAnimationController;

  Future makeMovieEntry(Movie movie, String TableName) async {
    await MoviesDatabase.instance.Insert(movie, MoviesModel.Moviesforall1);
  }

  Future makeMovieSumEntry(AllMovies allMovies) async {
    await MoviesDatabase.instance.InsertMovieSum(allMovies);
  }

  bool isLoading = true;
  late List<AllMovies> moviessumlst;
  Future readMovieSumEntry() async {
    this.moviessumlst = await MoviesDatabase.instance.readAllMovieSum();

    print(moviessumlst);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.pink)
        .animate(_animationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();

    // Creating One Movie Pack
    makeMovieSumEntry(AllMovies(
        MovieKey_all: MoviesModel.Moviesforall1,
        BackImg:
            "https://th.bing.com/th/id/OIP.wJQUMOYcJjuYBN9Oem1bTwHaEK?pid=ImgDet&rs=1",
        TimeTaken: "36",
        TotalNoOfMovies: "25",
        MovieKey: 1));
    makeMovieEntry(
        Movie(
            MovieKey_all: 1,
            Seconds: true,
            MovieTitle: "Avengers: The End Game",
            MovieImageUrl:
                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png",
            SecondsOrTimes: " 50"),
        MoviesModel.Moviesforall1);
    makeMovieEntry(
        Movie(
            MovieKey_all: 1,
            Seconds: true,
            MovieTitle: "Avatar",
            MovieImageUrl:
                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png",
            SecondsOrTimes: " 30"),
        MoviesModel.Moviesforall1);
    makeMovieEntry(
        Movie(
            MovieKey_all: 1,
            Seconds: true,
            MovieTitle: "Darknight",
            MovieImageUrl:
                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png",
            SecondsOrTimes: " 30"),
        MoviesModel.Moviesforall1);
    makeMovieEntry(
        Movie(
            MovieKey_all: 1,
            Seconds: true,
            MovieTitle: "Batman",
            MovieImageUrl:
                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png",
            SecondsOrTimes: " 20"),
        MoviesModel.Moviesforall1);
    makeMovieEntry(
        Movie(
            MovieKey_all: 1,
            Seconds: true,
            MovieTitle: "Superman",
            MovieImageUrl:
                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png",
            SecondsOrTimes: " 40"),
        MoviesModel.Moviesforall1);
    makeMovieEntry(
        Movie(
            MovieKey_all: 1,
            Seconds: true,
            MovieTitle: "Hulk",
            MovieImageUrl:
                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png",
            SecondsOrTimes: " 30"),
        MoviesModel.Moviesforall1);
    makeMovieEntry(
        Movie(
            MovieKey_all: 1,
            Seconds: true,
            MovieTitle: "Black Panther",
            MovieImageUrl:
                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png",
            SecondsOrTimes: " 60"),
        MoviesModel.Moviesforall1);
    // makeMovieSumEntry(AllMovies(
    //     AllName: MoviesModel.Moviesforall2,
    //     BackImg: "BACKIMAGEURL",
    //     TimeTaken: "36",
    //     TotalNoOfMovies: "25"));

    // makeMovieEntry(
    //     Movie(
    //         Seconds: true,
    //         MovieTitle: "Avengers: The End Game",
    //         MovieImageUrl: "DUMMYURL1",
    //         SecondsOrTimes: " 30"),
    //     MoviesModel.Moviesforall2);
    // makeMovieEntry(
    //     Movie(
    //         Seconds: true,
    //         MovieTitle: "Avatar",
    //         MovieImageUrl: "DUMMYURL2",
    //         SecondsOrTimes: " 30"),
    //     MoviesModel.Moviesforall2);
    // makeMovieEntry(
    //     Movie(
    //         Seconds: true,
    //         MovieTitle: "Darknight",
    //         MovieImageUrl: "DUMMYURL3",
    //         SecondsOrTimes: " 70"),
    //     MoviesModel.Moviesforall2);
    // makeMovieEntry(
    //     Movie(
    //         Seconds: true,
    //         MovieTitle: "Batman",
    //         MovieImageUrl: "DUMMYURL4",
    //         SecondsOrTimes: " 30"),
    //     MoviesModel.Moviesforall2);
    // makeMovieEntry(
    //     Movie(
    //         Seconds: true,
    //         MovieTitle: "Superman",
    //         MovieImageUrl: "DUMMYURL5",
    //         SecondsOrTimes: " 70"),
    //     MoviesModel.Moviesforall2);
    // makeMovieEntry(
    //     Movie(
    //         Seconds: true,
    //         MovieTitle: "Hulk",
    //         MovieImageUrl: "DUMMYURL6",
    //         SecondsOrTimes: " 30"),
    //     MoviesModel.Moviesforall2);
    // makeMovieEntry(
    //     Movie(
    //         Seconds: true,
    //         MovieTitle: "Black Panther",
    //         MovieImageUrl: "DUMMYURL7",
    //         SecondsOrTimes: " 30"),
    //     MoviesModel.Moviesforall2);

    readMovieSumEntry();
  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        // ignore: sort_child_properties_last
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(50, 120, 50, 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Color.fromARGB(255, 79, 78, 78),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "Streak",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("1",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("Movies Watched",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("35 Min.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("Watch Time",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Movies For All",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: moviessumlst.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Startup(
                                                        allMovies:
                                                            moviessumlst[index],
                                                        Moviekey:
                                                            moviessumlst[index]
                                                                .MovieKey
                                                                .toString())));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        moviessumlst[index]
                                                            .BackImg
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 150,
                                                  color: Colors.black26,
                                                ),
                                                Positioned(
                                                  right: 20,
                                                  left: 10,
                                                  top: 10,
                                                  child: Text(
                                                    moviessumlst[index]
                                                        .MovieKey_all,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 30,
                                                  left: 12,
                                                  top: 38,
                                                  child: Text(
                                                    moviessumlst[index]
                                                        .TimeTaken,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 175,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://th.bing.com/th/id/OIP.wJQUMOYcJjuYBN9Oem1bTwHaEK?pid=ImgDet&rs=1"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 150,
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 2,
                                    left: 5,
                                    child: Text(
                                      "Avengers: Infinity War",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Positioned(
                                    top: 25,
                                    right: 2,
                                    left: 5,
                                    child: Text(
                                      "Last Watched: Aug 15",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-2.png"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Deadpool",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Watched: Jul 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://www.macxdvd.com/mac-dvd-video-converter-how-to/article-image/hollywood-movie-6.png"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Avatar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Watched: Aug 04",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Movies For Students",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://befinexpert.files.wordpress.com/2019/06/pursuit-of-happiness.jpeg?w=525"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "The Pursuit Of Happyness",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Watched: Yesterday",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w780/93bOh3zmzqqHD9ZUSQjEmyeLXc0.jpg"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Pirates Of The Silicon Valley",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Watched: Aug 22",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://i.ytimg.com/vi/Y5SjV6SweGY/maxresdefault.jpg"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Taare Zameen Par",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 2,
                                        left: 5,
                                        child: Text(
                                          "Last Watched: Aug 24",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(
                      animationController: _animationController,
                      colorsTween: _colorTween,
                      drawerTween: _drawerTween,
                      homeTween: _homeTween,
                      iconTween: _iconTween,
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      yogaTween: _yogaTween)
                ],
              ),
            ),
          ],
        ),
        onNotification: scrollListner,
      ),
    );
  }
}
