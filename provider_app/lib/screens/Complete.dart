import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/DatabaseServices/localdb.dart';
import 'package:intl/intl.dart';

class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    "https://media.istockphoto.com/vectors/first-prize-gold-trophy-iconprize-gold-trophy-winner-first-prize-vector-id1183252990?k=20&m=1183252990&s=612x612&w=0&h=BNbDi4XxEy8rYBRhxDl3c_bFyALnUUcsKDEB5EfW2TY=",
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 13, horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "125",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Watch Time",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Watched Movies",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "DO IT AGAIN",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      "SHARE",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 70,
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "RATE OUR APP",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
              color: Color.fromARGB(255, 207, 205, 205),
            ),
            Consumer<UpdateMovieModel>(
              builder: (context, myModel, child) {
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}

class UpdateMovieModel with ChangeNotifier {
  UpdateMovieModel() {
    print("IT WORKS");
    SetMovieTime();
    LastMovieDoneOn();
    SetWatchTime(13);
  }

  int a = 1;

  void SetMovieTime() async {
    print("SetMovieTime");
    String? StartTime = await LocalDB.getStartTime();
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(StartTime ?? "2022-05-24 19:31:15.182");
    int difference = DateTime.now().difference(tempDate).inMinutes;
    int? mywotime = await LocalDB.getMovieTime();
    print(mywotime);
// LocalDB.setWorkOutTime( mywotime! + 59);
    LocalDB.setMovieTime(mywotime! + difference);
  }

  void LastMovieDoneOn() async {
    print("LAST MOVIE DONE");

    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(await LocalDB.getLastDoneOn() ?? "2022-05-24 19:31:15.182");
    int difference = DateTime.now().difference(tempDate).inDays;
    if (difference == 0) {
      print("GOOD JOB");
    } else {
      int? streaknow = await LocalDB.getStreak();
      LocalDB.setStreak(streaknow! + 1);
    }

    await LocalDB.setLastDoneOn(DateTime.now().toString());
  }

  void SetWatchTime(int mymovietime) async {
    print("SetMovieTime");
    int? MovieTime = await LocalDB.getWatchTime();
    print(MovieTime);
    LocalDB.setWatchTime(
        MovieTime.toString() == "null" ? 0 : MovieTime! + mymovietime);
  }
//TODO: Set the initial value of straek and lastdone on in starting of app
}
