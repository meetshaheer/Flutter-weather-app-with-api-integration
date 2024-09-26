import 'package:flutter/material.dart';

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

class weather extends StatelessWidget {
  const weather({super.key});

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
              Container(
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
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                        hintText: "Search for city weather",
                        hintStyle: TextStyle(fontFamily: "Noto", color: Color.fromARGB(255, 173, 173, 173)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 265,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 6, 64, 112),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                  size: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cloudy",
                                      style: TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                    Text(
                                      "Sun with a cool",
                                      style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "26°",
                              style: TextStyle(color: Colors.white, fontFamily: "Noto", fontSize: 50),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.device_thermostat,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "28°",
                                        style: TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                      ),
                                    ],
                                  ),
                                  Text(
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
                                      Icon(
                                        Icons.opacity,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "60%",
                                        style: TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                      ),
                                    ],
                                  ),
                                  Text(
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
                                      Icon(
                                        Icons.air,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "18 Km/h",
                                        style: TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Force",
                                    style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
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
                                    Icon(
                                      Icons.speed,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "28°",
                                      style: TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                Text(
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
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "60%",
                                      style: TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Visibility",
                                  style: TextStyle(color: Color.fromARGB(255, 212, 212, 212), fontFamily: "Noto"),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.water_drop,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "18 Km/h",
                                      style: TextStyle(color: Colors.white, fontFamily: "NotoB"),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Dew Point",
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
