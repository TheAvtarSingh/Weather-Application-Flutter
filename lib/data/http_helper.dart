import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:weather_app/data/weather.dart';

class HttpHelper {
  // http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=55c034d85d818c1ba983661fb5cca0c9
  // final String authority = 'api.openweathermap.org';
  // final String path = 'data/2.5/weather';
  // final String apiKey = '55c034d85d818c1ba983661fb5cca0c9';

  /* Future getWeather(String? city) async {
    Map<String, dynamic> parameters = {'q': city, 'appId': apiKey};
    Uri url = Uri.http(authority, path, parameters);
    http.Response response = await http.get(url);
    // Decode and Convert
    Map<String, dynamic> data = await jsonDecode(response.body);
    // print(data);

    return data;
  } */

  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$location&APPID=55c034d85d818c1ba983661fb5cca0c9&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    // print("I am Helper ${Weather.fromJson(body).cityname}");

    return Weather.fromJson(body);
  }
}
