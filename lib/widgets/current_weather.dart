import 'package:flutter/material.dart';

import '../model/weather_model.dart';

Widget currentWeather(String weatherIcon, String weatherDescription,
    String temp, String location) {
  Weather? weather;
  weather?.cityName = location;
  String iconImageUrl = "https://openweathermap.org/img/wn/$weatherIcon@4x.png";

  Image weatherIconImage = Image.network(
    iconImageUrl,
    // size related to the parent widget
    width: 150.0,
    height: 150.0,
    fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
  );

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        weatherIconImage,
        Text(
          // cityName from Weather
          weatherDescription,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp °C",
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
            color: Colors.grey[700],
          ),
        ),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

