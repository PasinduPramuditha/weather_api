import 'package:flutter/material.dart';

import '../widgets/additional_wind_information.dart';
import '../widgets/current_wind.dart';

class WindPage extends StatelessWidget {
  final String? location;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;

  const WindPage(
      {super.key, this.windSpeed, this.windDeg, this.windGust, this.location});
  final Icon windIcon = const Icon(
    Icons.air,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wind Information"),
      ),
      body: Column(
        children: [
          Container(
            child: currentWind(
                windIcon, '$windDeg', '$windGust', '$windSpeed', '$location'),
          ),
          const Divider(),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Additional Wind Information",
            style: TextStyle(
                fontSize: 24,
                color: Color(0xdd212121),
                fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(
            height: 20.0,
          ),
          additionalWindInformation('$windDeg', '$windGust'),
        ],
      ),
    );
  }
}
