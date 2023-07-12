import 'package:flutter/material.dart';

import '../api_calling/weather_api.dart';
import '../model/weather_model.dart';

import '../widgets/additional_information.dart';
import '../widgets/current_weather.dart';
import '../widgets/drawer.dart';
import '../widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();

  Weather? data;
  final TextEditingController _searchController = TextEditingController();

  String selectedCity = "Colombo";

  void _searchCity(String city) {
    if (city.isEmpty) {
      return;
    }
    Future.delayed(Duration.zero, () {
      setState(() {
        selectedCity = city;
      });
    });
  }

  Future<void> getData() async {
    data = await client.getCurrentWeather(selectedCity);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(
              //
              ),
        ),
        centerTitle: true,

        // menu for 4 buttons which leads to Wind, Humidity, Pressure, Feels Like
      ),
      drawer: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return DrawerWidget(selectedCity: selectedCity, data: data);
          }),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.blue.shade100],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
              stops: const [0.3, 0.7]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Search(
              controller: _searchController,
              onSubmitted: _searchCity,
            ),
            //add image from network here
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: getData(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: currentWeather(
                                '${data!.weatherIcon}',
                                '${data!.weatherDesc}',
                                '${data!.temp}',
                                '${data!.cityName}'),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "Additional Information",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xdd212121),
                                fontWeight: FontWeight.bold),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          additionalInformation(
                              '${data!.windSpeed}',
                              '${data!.humidity}',
                              '${data!.pressure}',
                              '${data!.feelsLike}'),
                        ],
                      );
                    }
                    return Container();
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
