import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  late String time; //the time in location
  String flag; //url to an asset flag icon
  String url;

  static var data; //location url for api endpoint
  WorldTime(
      {required this.time,
      required this.location,
      required this.flag,
      required this.url});

  Future<void> getTime() async {
    try {
      // makeing the request

      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // getting the properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      print(offset);

      // Create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property

      time = DateFormat.jm().format(now);

      // String Username = await Future.delayed(Duration(seconds: 3), () {
      //   return 'Peter';
      // });
      // String Bio = await Future.delayed(Duration(seconds: 3), () {
      //   return 'Actor, Worked In Twilight. ';
      // });
      // print('$Username ~ $Bio');

    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data ';
    }
  }
}
