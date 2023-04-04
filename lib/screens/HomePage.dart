import 'package:flutter/material.dart';
import 'package:weather_app/screens/moreWeather.dart';

import '../data/http_helper.dart';
import '../data/weather.dart';
import '../main.dart';
import 'Weather.dart';
import 'additionalInfo.dart';

class DataUpdate extends StatefulWidget {
  const DataUpdate({super.key});

  @override
  State<DataUpdate> createState() => _DataUpdateState();
}

class _DataUpdateState extends State<DataUpdate> {
  HttpHelper helper = HttpHelper();
  Weather? data;

  Future<void> getData() async {
    data = await helper.getCurrentWeather(location);
  }

  void refreshList() {
    // reload
    setState(() {
      location = location;
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                SearchBar(),

                // TextWidget(Icons.wb_sunny_rounded, "26.4", location),
                (data!.temp! <= 10.0)
                    ? upperWeather(
                        Icons.wb_cloudy_sharp, "${data!.temp}", location)
                    : (data!.temp! <= 0.0)
                        ? upperWeather(
                            Icons.sunny_snowing, "${data!.temp}", location)
                        : upperWeather(
                            Icons.wb_sunny_rounded, "${data!.temp}", location),

                // moreWeather("${data!.main}", "${data!.description}"),
                additionalInfo("${data!.wind}", "${data!.humidity}",
                    "${data!.pressure}", "${data!.feels_like}"),
                // DummyWeather(Icons.wb_sunny_rounded, "26.4", location),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.deepPurple),
            );
          }
          return ListView(
            children: [SearchBar(), Text("City Not Found!! Try Again!")],
          );
        });
  }
}
