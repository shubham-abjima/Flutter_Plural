import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static String timeKey = "TIMEKEY";
  static String lastDoneOn = "LASTDONEON";
  static String StreakKey = "StreakKey";
  static String WatchTimeKey = "WatchTimeKey";
  static String MovieTimeKey = "MovieTimeKey";
  static String FirstTime = "FIRSTTIMEKEY";

  //To calculate workout duration
  static Future<bool> setStartTime(String Time) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(timeKey, Time);
  }

  static Future<String?> getStartTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(timeKey);
  }

//To maintain the streak increment

  static Future<bool> setLastDoneOn(String Date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(lastDoneOn, Date);
  }

  static Future<String?> getLastDoneOn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(lastDoneOn);
  }

//To fetch and save the value of streak
  static Future<bool> setStreak(int streak) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(StreakKey, streak);
  }

  static Future<int?> getStreak() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(StreakKey);
  }

// To fetch and save the kCAL of workout
  static Future<bool> setWatchTime(int kcal) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(WatchTimeKey, kcal);
  }

  static Future<int?> getWatchTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(WatchTimeKey);
  }

//To save and fetch the overall workout time
  static Future<bool> setMovieTime(int minutes) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(MovieTimeKey, minutes);
  }

  static Future<int?> getMovieTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(MovieTimeKey);
  }

  static Future<bool> setFirstTime(bool isFirstTime) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(FirstTime, isFirstTime);
  }

  static Future<bool?> getFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(FirstTime);
  }
}
