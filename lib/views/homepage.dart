import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../provider/connectivty_provider.dart';
import '../provider/weather_provider.dart';
import '../utils/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  WeatherModel? weatherModel;

  late Future<WeatherModel?> weatherdata;

  @override
  void initState() {
    super.initState();
    weatherdata = APIHelper.apiHelper.fetchweather(locationame: "Surat");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Provider.of<ConnectivityProvider>(context)
                  .connectitvityModel
                  .connectivitystatus ==
              "Waiting..")
          ? const Center(
              child: Text("No Data Connection"),
            )
          : FutureBuilder(
              future: Provider.of<WeatherProvider>(context, listen: false)
                  .Weatherdata(locationame: "Surat"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  WeatherModel? weatherdata = snapshot.data;
                  return (weatherdata == null)
                      ? const Center(
                          child: Text("No Data avilable"),
                        )
                      : Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://img.freepik.com/free-photo/dusk-colorful-dramatic-yellow-sun_1203-5704.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('manage_cities_page');
                                      },
                                      icon: Icon(
                                        CupertinoIcons.add,
                                        size: 30,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${weatherdata.name}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${weatherdata.region}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              ", ${weatherdata.country}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('setting_page');
                                      },
                                      icon: Icon(
                                        Icons.more_vert,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${weatherdata.temp_c}",
                                              style: const TextStyle(
                                                fontSize: 80,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "◦c",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 80,
                                        ),
                                        Text(
                                          "${weatherdata.localtime}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...weatherdata.hour
                                                  .map(
                                                    (e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            e['time']
                                                                .toString()
                                                                .split(" ")[1],
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            e['temp_c']
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(
                                          height: 3,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Weather Details",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(
                                          height: 3,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Apparent Temperature",
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  "${weatherdata.feelslike_c} ◦c"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Humidity",
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  "${weatherdata.humidity} %"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "SW Wind",
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  " ${weatherdata.wind_kph} km/h"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 120,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "UV",
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  "${weatherdata.uv}"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Visibility",
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  "${weatherdata.vis_km} km"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Air Pressure",
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  "${weatherdata.pressure_mb} hPa"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }
}
