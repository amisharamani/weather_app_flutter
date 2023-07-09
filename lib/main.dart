import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/connectivty_provider.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/views/about_page.dart';
import 'package:weather/views/add_city_page.dart';
import 'package:weather/views/homepage.dart';
import 'package:weather/views/manage_cities_page.dart';
import 'package:weather/views/setting_page.dart';
import 'package:weather/views/splacescreen.dart';
import 'package:weather/views/temperature_unit_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        routes: {
          '/': (context) => splacescreen(),
          'home_page': (context) => HomePage(),
          'manage_cities_page': (context) => ManageCitiesPage(),
          'add_city_page': (context) => AddCityPage(),
          'setting_page': (context) => SettingPage(),
          'temperature_unit_page': (context) => TemperatureUnitPage(),
          'about_page': (context) => AboutPage(),
        },
      ),
    ),
  );
}
