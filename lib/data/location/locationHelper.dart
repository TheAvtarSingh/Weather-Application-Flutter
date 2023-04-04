import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:weather_app/data/location/location.dart';

class LocationHelper {
  Future<Location> lookupUserCountry() async {
    final endPoint = Uri.parse('https://ipapi.co/json');
    final response = await http.get(endPoint);
    var body = jsonDecode(response.body);
    return Location.fromJson(body);
  }
}
