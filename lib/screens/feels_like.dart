import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../widgets/current_feels_like.dart';

class FeelsLikePage extends StatelessWidget {
  final String? location;
  final double? feelsLike;

  const FeelsLikePage({super.key, this.location, this.feelsLike});

  // Icon
  final Icon feelsLikeIcon = const Icon(
    WeatherIcons.barometer,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Feels Like"),
      ),
      body: Column(
        children: [
          currentFeelsLike(feelsLikeIcon, '$feelsLike', '$location'),
          const Divider(),
        ],
      ),
    );
  }
}
