import 'package:flutter/material.dart';

Widget additionalInfo(
    String wind, String humidity, String pressure, String feels_like) {
  return Table(
    children: [
      TableRow(children: [
        Center(
          child: Text(
            "Wind",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text("$wind"),
        ),
        Center(
          child: Text(
            "Humidity",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text("$humidity"),
        ),
      ]),
      TableRow(children: [
        Center(
          child: Text(
            "Feels Like",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text("$feels_like"),
        ),
        Center(
          child: Text(
            "Pressure",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text("$pressure"),
        ),
      ])
    ],
  );
}
