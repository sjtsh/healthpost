import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'Screens/Auth/Signin.dart';
import 'Screens/Navigation/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Geolocator.requestPermission();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
