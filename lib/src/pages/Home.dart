import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:movies/src/Images.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Color(0xFF0F1016),
          primaryColor: Color(0xFFBABBC2),
          textTheme: TextTheme(
              headline1: TextStyle(color: Color(0xFFBABBC2), fontSize: 25))),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 30),
                  child: Text(
                    'Coming Soon',
                    style: theme.textTheme.headline1,
                  ),
                ),
                Center(
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        Images.spiderman,
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: window.physicalSize.width * 0.8,
                    height: window.physicalSize.height * 0.26,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                child: Text(
                  'Trends now',
                  style: theme.textTheme.headline1,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    initialPage: 0,
                    pageSnapping: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.decelerate),
                items: Images.images
                    .map((e) => Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              e,
                              fit: BoxFit.fill,
                            ),
                          ),
                          // color: Colors.amber,
                          width: window.physicalSize.width * 0.8,
                          height: 100,
                        ))
                    .toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
