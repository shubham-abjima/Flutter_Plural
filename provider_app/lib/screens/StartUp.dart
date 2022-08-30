import 'package:flutter/material.dart';
import 'package:provider_app/DatabaseServices/Moviedb.dart';
import 'package:provider_app/Model/model.dart';
import 'package:provider_app/screens/Ready.dart';

class Startup extends StatefulWidget {
  String Moviekey;
  AllMovies allMovies;
  Startup({required this.Moviekey, required this.allMovies});

  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadAllMovies();
  }

  late List<Movie> AllMovies;
  bool isLoading = true;
  Future ReadAllMovies() async {
    this.AllMovies = (await MoviesDatabase.instance
            .readAllMovie(widget.allMovies.MovieKey_all))
        .cast<Movie>();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Ready(
                MovieTableName: widget.allMovies.MovieKey_all,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            "Start",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            // backgroundColor: Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text("Movies"),
              background: Image.asset(
                widget.allMovies.BackImg.toString(),
                fit: BoxFit.cover,
              ),
            ),
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.thumb_up_alt_rounded),
            //   )
            // ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${widget.allMovies.TimeTaken} Mins || ${widget.allMovies.MovieKey_all} Workouts",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                      itemBuilder: (context, index) => ListTile(
                            leading: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Image.asset(
                                  AllMovies[index].MovieImageUrl,
                                  fit: BoxFit.cover,
                                )),
                            title: Text(
                              AllMovies[index].MovieTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            subtitle: Text(
                                AllMovies[index].Seconds
                                    ? "00:${AllMovies[index].SecondsOrTimes}"
                                    : "x${AllMovies[index].SecondsOrTimes}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                          ),
                      itemCount: AllMovies.length)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
