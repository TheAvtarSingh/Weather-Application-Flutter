// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  String? cityname;
  double? description;
  double? main;
  double? temp;
  // double? mintemp;
  // double? maxtemp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather({
    // this.mintemp,
    // this.maxtemp,
    this.cityname,
    this.description,
    this.main,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    cityname = json["name"];
    main = json["main"]["temp_min"];
    description = json["main"]["temp_max"];

    temp = json["main"]["temp"];

    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
}
