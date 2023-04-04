import 'package:flutter/material.dart';
import 'package:weather_app/data/http_helper.dart';
import 'package:weather_app/data/location/locationHelper.dart';
import 'package:weather_app/data/weather.dart';
import 'package:weather_app/screens/locationPage.dart';
import 'package:weather_app/screens/moreWeather.dart';

import 'screens/Weather.dart';
import 'screens/additionalInfo.dart';
import 'screens/getYourLocation.dart';

LocationHelper locationClass = LocationHelper();
var location = "Faridabad";
var wannaSeach = "";

void main(List<String> args) {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF'),
      title: "Weather Application",
      initialRoute: '/',
      routes: {
        '/': (context) => ScaffoldBar(),
        '/getLocation': (context) => const YourLocation(),
      },
      // home: ScaffoldBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScaffoldBar extends StatefulWidget {
  // final String fetchedLocation;
  const ScaffoldBar({super.key});

  @override
  State<ScaffoldBar> createState() => _ScaffoldBarState();
}

class _ScaffoldBarState extends State<ScaffoldBar> {
  HttpHelper helper = HttpHelper();
  Weather? data;

  Future<void> getData() async {
    data = await helper.getCurrentWeather(location);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // location = widget.fetchedLocation;
    });
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Weather Application",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 29, 36, 122),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  children: [
                    SearchBar(),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              location = location;
                              // if (widget.fetchedLocation == null) {
                              //   location = widget.fetchedLocation;
                              // }
                            });
                          },
                          child: Text("Press to Refresh Location"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 29, 36, 122)),
                        ),
                      ),
                    ),

                    // TextWidget(Icons.wb_sunny_rounded, "26.4", location),
                    (data!.temp! <= 10.0 && data!.temp! > 0.0)
                        ? upperWeather(Icons.wb_cloudy_sharp, "${data!.temp}",
                            "${data!.cityname}")
                        : (data!.temp! <= 0.0)
                            ? upperWeather(Icons.sunny_snowing, "${data!.temp}",
                                "${data!.cityname}")
                            : upperWeather(Icons.wb_sunny_rounded,
                                "${data!.temp}", "${data!.cityname}"),
                    Center(child: moreWeather(data!.main, data!.description)),
                    AdditionalInfl(),
                    additionalInfo("${data!.wind}", "${data!.humidity}",
                        "${data!.pressure}", "${data!.feels_like}"),
                    SizedBox(
                      height: 15.0,
                    ),
                    LocationButton()

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
            })
        // drawer: Drawer(backgroundColor: Colors.deepPurpleAccent,child: Row(children: [Image(image: Image.)],),),
        );
  }
}

class SearchBar extends StatefulWidget {
  HttpHelper helper = HttpHelper();
  Weather? data;

  Future<void> getData() async {
    data = await helper.getCurrentWeather(location);
  }

  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var locationField = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(top: 10.0),
      child: TextField(
        controller: locationField,
        decoration: InputDecoration(
          label: Center(
            child: Text(
              "Location",
            ),
          ),
          hintText: "Enter Your Location and Press Enter",
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(20.0)),
        ),
        onTapOutside: (event) => setState(() {
          location = locationField.text;
        }),

        // onSubmitted: (value) {
        //   setState(() {
        //     location = locationField.text;
        // onEditingComplete: () => setState(() {
        //   location = locationField.text;
        // }),//     // widget.getData();
        //   });
        //   // getData().then((value) => {print("Id that was loaded: $value")});
        // },
      ),
    );
  }

  /*  Future getData() async {
    HttpHelper helper = HttpHelper();

    result = await helper.getWeather(location);

    setState(() {});
  } */
}

class AdditionalInfl extends StatelessWidget {
  const AdditionalInfl({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: Text(
          "Additional Information",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
