import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/constants/api_key.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: weather(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class weather extends StatefulWidget {
  const weather({super.key});

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  List weatherList = [];

  TextEditingController searchController = TextEditingController();

  final WeatherFactory _wf = WeatherFactory(API_KEY);
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName("Karachi").then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  getWeatherData() {
    if (searchController.text.isEmpty) {
      searchController.text = "Karachi";
    }

    _wf.currentWeatherByCityName(searchController.text.toString()).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              appBar(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: const Color.fromARGB(255, 233, 233, 233),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10, top: 15),
                  child: TextFormField(
                    controller: searchController,
                    cursorColor: Colors.black,
                    // textInputAction: TextInputAction.search,
                    cursorHeight: 30,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_outlined),
                        hintText: "Search for city weather",
                        hintStyle: TextStyle(fontFamily: "Noto", color: Color.fromARGB(255, 173, 173, 173)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 2, 25, 44),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 2, 25, 44)),
                  ),
                  onPressed: () {
                    setState(() {
                      //
                      weatherList.insertAll(0, [
                        [
                          _weather?.weatherMain,
                          _weather?.weatherDescription,
                          _weather?.temperature?.celsius?.toStringAsFixed(0),
                          _weather?.tempFeelsLike?.celsius?.toStringAsFixed(0),
                          _weather?.humidity?.toStringAsFixed(0),
                          _weather?.windSpeed?.toStringAsFixed(0),
                          _weather?.pressure?.toStringAsFixed(0),
                          _weather?.windDegree?.toStringAsFixed(0),
                          _weather?.cloudiness.toString(),
                        ]
                      ]);
                      getWeatherData();
                      print(weatherList);
                    });
                  },
                  child: const Text(
                    "Hit to get the weather",
                    style: TextStyle(color: Colors.white, fontFamily: "NotoB", fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 6, 64, 112),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_weather?.areaName}, ${_weather?.country}  --- ",
                              style: TextStyle(color: Colors.white, fontFamily: "Noto", fontSize: 15),
                            ),
                            Text(_weather?.date?.toLocal().toString().substring(10, 19) ?? "",
                                style: TextStyle(color: Colors.white, fontFamily: "Noto", fontSize: 15)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Icon(
                                //   Icons.cloud,
                                //   color: Colors.white,
                                //   size: 70,
                                // ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  // color: Colors.amber,
                                  child: Image(
                                      image: NetworkImage(
                                          "https://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png")),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _weather?.weatherMain ?? "0",
                                      style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                    Text(
                                      _weather?.weatherDescription ?? "",
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°C" ?? "0°C",
                              style: const TextStyle(color: Colors.white, fontFamily: "Noto", fontSize: 50),
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "${_weather?.sunrise?.toLocal().toString().substring(10, 16)} AM" ?? "",
                                        style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Sunrise",
                                    style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                  ),
                                ],
                              ),
                              //
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.sunny_snowing,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "${_weather?.sunset?.toLocal().toString().substring(10, 16)} Pm" ?? "",
                                        style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Sunset",
                                    style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.snowing,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        _weather?.rainLastHour?.toStringAsFixed(0) == null
                                            ? "No Rain"
                                            : _weather!.rainLastHour.toString(),
                                        style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Rain",
                                    style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.device_thermostat,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      _weather?.tempFeelsLike?.celsius?.toStringAsFixed(0) ?? "0",
                                      style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Sensible",
                                  style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                ),
                              ],
                            ),
                            //
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.opacity,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${_weather?.humidity?.toStringAsFixed(0)} %" ?? "0.00",
                                      style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Humidity",
                                  style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.air,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${_weather?.windSpeed?.toStringAsFixed(0)} Km/h" ?? "0",
                                      style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Force",
                                  style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.speed,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      _weather?.pressure?.toStringAsFixed(0) ?? "0.00",
                                      style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Pressure",
                                  style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                ),
                              ],
                            ),
                            //
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.ac_unit,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      _weather?.windDegree?.toStringAsFixed(0) == "0"
                                          ? "No"
                                          : "${_weather?.windDegree?.toStringAsFixed(0)}°",
                                      style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Wind Degree",
                                  style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.cloud,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      _weather?.cloudiness?.toStringAsFixed(0) == "0"
                                          ? "No"
                                          : "${_weather?.cloudiness?.toStringAsFixed(0)}%",
                                      style: const TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Cloudness",
                                  style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class appBar extends StatelessWidget {
  const appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 220, 219, 219),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.adjust,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              "Dashboard",
              style: TextStyle(fontFamily: "NotoB", fontSize: 15),
            ),
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_important,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
