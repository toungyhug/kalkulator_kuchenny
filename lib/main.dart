import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalkulator_kuchenny/pages/home.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator kuchenny',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        accentColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}
