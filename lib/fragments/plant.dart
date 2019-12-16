import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Plant extends StatefulWidget {
  PlantState createState() => PlantState();
}

class PlantState extends State<Plant> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.dark, //navigation bar icons' color
    ));
    return Container(
      color: Colors.green,
    );
  }
}
