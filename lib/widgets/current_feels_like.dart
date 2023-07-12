import 'package:flutter/material.dart';

import '../model/weather_model.dart';

Widget currentFeelsLike(Icon feelsLikeIcon, String feelsLike, String location) {
  Weather? weather;
  weather?.cityName = location;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        feelsLikeIcon,
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "$feelsLike °C",
          style: const TextStyle(
            fontSize: 46.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          // cityName from Weather
          location,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

