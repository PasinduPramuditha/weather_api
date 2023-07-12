import 'package:flutter/material.dart';

import '../model/weather_model.dart';

Widget currentPressure(Icon pressureIcon, String humidity, String location) {
  Weather? weather;
  weather?.cityName = location;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pressureIcon,
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "$humidity hPa",
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

