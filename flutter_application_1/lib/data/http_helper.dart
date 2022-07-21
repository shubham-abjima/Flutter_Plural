import 'dart:convert';

import 'package:flutter_application_1/data/weather.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  //http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=941d2ed113f40c9ca77e22a0326dce4b
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '40120733bd1a17e7670cad27b2c80c55';

  // In flutter future class is used to perform the Asynchronous tasks
  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appID': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
