import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/main.dart';

import '../data/location/location.dart';
import '../data/location/locationHelper.dart';

class YourLocation extends StatefulWidget {
  const YourLocation({super.key});

  @override
  State<YourLocation> createState() => _YourLocationState();
}

class _YourLocationState extends State<YourLocation> {
  LocationHelper locationHelper = LocationHelper();
  Location? ldata;

  Future<void> getLocData() async {
    ldata = await locationHelper.lookupUserCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "WEAppL",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 29, 36, 122),
      ),
      body: FutureBuilder(
          future: getLocData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.city}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.country}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.countryCode}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.region}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.regionName}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.zip}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.timezone}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.lat}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 29, 36, 122),
                    child: Center(
                        child: Text(
                      '${ldata?.lon}',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, '${ldata?.city}');
                        },
                        child: Text("Fetch Weather with This Location"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 29, 36, 122)),
                      ),
                    ),
                  ),
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
          }),
    );
  }
}
