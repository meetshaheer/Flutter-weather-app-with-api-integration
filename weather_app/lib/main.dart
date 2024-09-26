import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 250,
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
                                      style: TextStyle(color: Colors.white, fontFamily: "Noto"),
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
                        Row(
                          children: [
                            Column(
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
                                  style: TextStyle(color: Colors.grey, fontFamily: "Noto"),
                                ),
                              ],
                            )
                          ],
                        )
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
