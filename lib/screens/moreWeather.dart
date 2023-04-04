import 'package:flutter/material.dart';

Widget moreWeather(double? main, double? description) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(bottom: 20.0, left: 40.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Center(
              child: Text(
                "Min Temp",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Text(
              "$main °C",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 5.0),
            child: Center(
              child: Text(
                "Max Temp",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Text(
              "$main °C",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    ),
  );
}
