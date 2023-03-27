import 'package:flutter/material.dart';

Widget upperWeather(IconData icon, String temp, String cityName) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Icon(
          icon,
          size: 80.0,
          color: Colors.orange,
        )),
        SizedBox(height: 20.0),
        Center(
          child: Text(
            "$temp °C",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Text(
            "$cityName",
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Additional Information",
          style: TextStyle(fontSize: 25.0),
        ),
      ],
    ),
  );
}
