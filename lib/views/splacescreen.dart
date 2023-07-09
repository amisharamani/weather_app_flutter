import 'dart:async';

import 'package:flutter/material.dart';

class splacescreen extends StatefulWidget {
  const splacescreen({super.key});

  @override
  State<splacescreen> createState() => _splacescreenState();
}

class _splacescreenState extends State<splacescreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.of(context).pushReplacementNamed("home_page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/e5/94/34/e59434c84ca59869537899717a159cac.gif"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(children: [
          SizedBox(
            height: 120,
          ),
          Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/256/Status-weather-few-clouds-icon.png"),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
